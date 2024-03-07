import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/function/validation_function.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/landing/screen/landing_screen.dart';
import 'package:reservation_app/view/sign_in/bloc/sign_in_bloc.dart';
import 'package:reservation_app/view/sign_in/widget/custom_text_field.dart';
import 'package:reservation_app/widget/material_loader.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInBloc _signInBloc;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    _signInBloc = context.read<SignInBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(UiString.stringAsset.signInScreenAppBarTitle)),
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          _listener(state, context);
        },
        builder: (context, state) => _signUpBlocBuilder(state),
      ),
    );
  }

  void _listener(SignInState state, BuildContext context) {
    if (state is OnSignUpSuccessfulState) {
      Navigator.pushReplacementNamed(context, LandingScreen.tag);
    }
  }

  void _validation() {
    if (_formKey.currentState!.validate()) {
      _signInBloc.add(LoginButtonEvent(
          email: _emailController.text, password: _passwordController.text));
    }
  }

  Widget _signUpBlocBuilder(SignInState state) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textFieldTitle(UiString.stringAsset.emailString),
            _emailTextField(),
            _spacer(),
            _textFieldTitle(UiString.stringAsset.passwordString),
            _passwordTextField(),
            _spacer(),
            _loginButton(state)
          ],
        ),
      ),
    ));
  }

  Widget _textFieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(title),
    );
  }

  CustomTextField _emailTextField() {
    return CustomTextField(
      hintText: UiString.stringAsset.emailFieldHintText,
      textEditingController: _emailController,
      validator: ValidationFunction.emailValidator,
    );
  }

  Widget _spacer() {
    return const SizedBox(
      height: 20,
    );
  }

  CustomTextField _passwordTextField() {
    return CustomTextField(
      hintText: UiString.stringAsset.passwordFieldHintText,
      textEditingController: _passwordController,
      maxLength: 8,
      validator: ValidationFunction.passwordValidator,
    );
  }

  Widget _loginButton(SignInState state) => Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: _loginButtonStyle(),
              onPressed: () {
                _validation();
              },
              child: state is SignInLoader
                  ? const MaterialLoader()
                  : Text(
                      UiString.stringAsset.loginButtonText,
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
        ),
      );

  ButtonStyle _loginButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
  }
}
