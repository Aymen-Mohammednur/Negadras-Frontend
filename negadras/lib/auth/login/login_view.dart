import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/models/response/loginResponse.dart';
import 'package:negadras/auth/repository/auth_repository.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/auth/login/bloc/login_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RepositoryProvider(
            create: (context) =>
                AuthRepository(AuthDataProvider(http.Client())),
            child: Scaffold(
              backgroundColor: Color.fromRGBO(20, 40, 65, 1),
              body: BlocProvider(
                create: (context) =>
                    LoginBloc(authRepo: context.read<AuthRepository>()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _label(),
                    _loginForm(),
                    _showSignUpButton(),
                  ],
                ),
              ),
            )));
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state.formStatus is SubmissionFailed) {
          _showSnackBar(context, "Username or Password is wrong");
        } else if (state.formStatus is SubmissionSuccess) {
          LoginResponse loginResponse =
              (state.formStatus as SubmissionSuccess).response as LoginResponse;
          SharedPreferences prefs = await _prefs;

          await prefs.setString("user_id", loginResponse.id);
          await prefs.setString("token", loginResponse.token);

          context.router
              .pushAndPopUntil(HomeRoute(), predicate: (route) => false);
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _usernameField(),
                _passwordField(),
                SizedBox(
                  height: 30,
                ),
                _loginButton(),
              ],
            )),
      ),
    );
  }

  Widget _label() {
    return SafeArea(
      child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Sign In to Negadras',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.amberAccent),
          )),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: usernameController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: ImageIcon(
                AssetImage("assets/images/icons8-person-24.png"),
                color: Colors.amber.shade200,
              ),
              hintText: 'Username',
              hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(color: Colors.white),
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              icon: ImageIcon(
                  AssetImage("assets/images/icons8-password-24.png"),
                  color: Colors.amber.shade200),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
          validator: (value) =>
              state.isValidPassword ? null : 'Password is too short',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state.formStatus is FormSubmitting) {
          return CircularProgressIndicator(
            color: Colors.amberAccent,
          );
        } else {
          return ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
                minimumSize: Size(200, 48),
              ),
              // style: ButtonStyle(
              //     shadowColor: MaterialStateProperty.all(Colors.grey),
              //     backgroundColor:
              //     MaterialStateProperty.all<Color>(Colors.black87)),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ));
        }
      },
    );
  }

  Widget _showSignUpButton() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: TextButton(
          onPressed: () {
            context.router.push(SignUpRoute());
          },
          child: Text('Don\'t have an account? Sign Up.',
              style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
