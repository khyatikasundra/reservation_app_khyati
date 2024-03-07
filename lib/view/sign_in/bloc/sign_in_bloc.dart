import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LoginButtonEvent>(_validationSuccessful);
  }

  void _validationSuccessful(
      LoginButtonEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoader());
    await Future.delayed(const Duration(seconds: 3));
    emit(OnSignUpSuccessfulState());
  }
}
