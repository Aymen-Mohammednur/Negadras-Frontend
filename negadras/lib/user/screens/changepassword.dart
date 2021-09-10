// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/user/form_submission_status.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/user/blocs/user_bloc.dart';
import 'package:negadras/user/data_providers/user_data_provider.dart';

import 'package:negadras/user/repository/user_repository.dart';

import 'package:auto_route/auto_route.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  late String newPassword;
  String passedId = "6134db2369ba186847c14dba";

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RepositoryProvider(
            create: (context) =>
                UserRepository(dataProvider: UserDataProvider()),
            child: Scaffold(
              body: BlocProvider(
                create: (context) =>
                    UserBloc(userRepository: context.read<UserRepository>()),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _label(),
                    _changePasswordForm(),
                  ],
                ),
              ),
            )));
  }

  Widget _changePasswordForm() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          // _showSnackBar(context, formStatus.exception.toString());
          _showSnackBar(context, "Some error occured");
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _label(),
                _passwordField(),
                _newPasswordField(),
                _confirmPasswordField(),
                SizedBox(
                  height: 10,
                ),
                _submitButton(),
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
            'Change your Password',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          )),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.security), hintText: 'Current Password'),
          // validator: (value) =>
          //     state.isValidPassword ? null : 'Password is too short',
          // onChanged: (value) => context.read<UserBloc>().add(UpdatePassword(
          //     id: "to be received from session", password: value)),
        );
      },
    );
  }

  Widget _newPasswordField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.security), hintText: 'New Password'),
          // validator: (value) =>
          //     state.isValidPassword ? null : 'Password is too short',
          // onChanged: (value) => context.read<UserBloc>().add(UpdatePassword(
          //     id: "to be received from session", password: value)),
        );
      },
    );
  }

  Widget _confirmPasswordField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.security), hintText: 'Confirm New Password'),
          // validator: (value) =>
          //     state.isValidConfirmPassword ? null : 'Password does not match',
          // onChanged: (value) => context.read<UserBloc>().add(UpdatePassword(
          //     id: "to be received from session", password: value)),
          onChanged: (value) {
            setState(() {
              this.newPassword = value;
            });
          },
        );
      },
    );
  }

  Widget _submitButton() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form != null && form.validate()) {
                    form.save();
                    BlocProvider.of<UserBloc>(context)
                        .add(UpdatePassword(password: newPassword));
                    context.router.pop();
                    _showSnackBar(context, "Success");
                  }
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   context.read<UserBloc>().add(UserSubmitted());
                  //   context.router.push(HomeRoute());
                  // }
                },
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87)),
                child: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.white),
                ));
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
