import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:retrofit_examples/data.dart';
import 'package:retrofit_examples/data/ApiRepository.dart';

part 'cubit_state.dart';

class UserCubit extends Cubit<CubitState> {
  List<dynamic> list;

  UserCubit() : super(InitialState());

  Future<User> getUsersList() async {
    var resRes = await ApiRepository().getUsers();

    if (resRes!=null) {

      list=resRes.data;
      if (list.length > 0) {
        emit(SuccessState(message: "User fetched"));
      } else {
        emit(FailedState(message: "Failed to fetched"));
      }
    } else {
      emit(FailedState(message: "Something went wrong"));
    }
  }
}
