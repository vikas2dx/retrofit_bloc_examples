import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_examples/data.dart';
import 'package:retrofit_examples/data/cubit/user_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserCubit userCubit = UserCubit();
  List<dynamic> list;


  @override
  void initState() {
    userCubit.getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List"),),
      body: BlocBuilder<UserCubit, CubitState>(
        cubit: userCubit,
        builder: (context, state) {
          if (state is LoadingState) {
            return CircularProgressIndicator();
          } else if (state is SuccessState) {
            list = userCubit.list;
            return Container(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                          child: Text(list[index]['name'])));
                },
              ),
            );
          } else if( state is FailedState) {
            return Center(
              child: Text(state.message),
            );
          }else{
            return Center(child: Text("Unknown error"),);
          }
        },
      ),
    );
  }
}
