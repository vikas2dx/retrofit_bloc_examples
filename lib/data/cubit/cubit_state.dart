part of 'user_cubit.dart';

class CubitState {
}

class InitialState extends CubitState {}

class FailedState extends CubitState {
  String message;

  FailedState({this.message});
}

class SuccessState extends CubitState {
  String message;

  SuccessState({this.message});
}

class LoadingState extends CubitState {}
