part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

// class LoginInitial extends LoginState {
//   @override
//   List<Object> get props => [];
// }

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
