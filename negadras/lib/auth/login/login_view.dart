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
    return MaterialApp(
        home: RepositoryProvider(
            create: (context) => AuthRepository(AuthDataProvider(http.Client())),
            child: Scaffold(
              body: BlocProvider(
                create: (context) =>
                    LoginBloc(authRepo: context.read<AuthRepository>()),
                child: Stack(
                  alignment: Alignment.bottomCenter,
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
        }else if (state.formStatus is SubmissionSuccess){
          LoginResponse loginResponse = (state.formStatus as SubmissionSuccess).response as LoginResponse;
          SharedPreferences prefs = await _prefs;

          await prefs.setString("user_id",loginResponse.id);
          await prefs.setString("token",loginResponse.token);

          context.router.pushAndPopUntil(HomeRoute(),predicate: (route)=>false);
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _usernameField(),
                _passwordField(),
                SizedBox(
                  height: 10,
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
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          )),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: usernameController,
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: 'Username'),
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
          controller: passwordController,
          obscureText: true,
          decoration:
              InputDecoration(icon: Icon(Icons.security), hintText: 'Password'),
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
        if(state.formStatus is FormSubmitting){
          return CircularProgressIndicator();
        }else{
          return ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black87)),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
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
          child: Text(
            'Don\'t have an account? Sign Up.',
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
