part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonEvent extends SignInEvent {
  final String? email;
  final String? password;
  const LoginButtonEvent({this.email, this.password});
  @override
  List<Object> get props => [];
}
