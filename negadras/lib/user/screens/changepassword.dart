// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/user/form_submission_status.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/user/blocs/user_bloc.dart';
import 'package:negadras/user/data_providers/user_data_provider.dart';

import 'package:negadras/user/repository/user_repository.dart';

import 'package:auto_route/auto_route.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  late String newPassword;
  // String passedId = "6134db2369ba186847c14dba";

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String oldPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RepositoryProvider(
            create: (context) =>
                UserRepository(dataProvider: UserDataProvider()),
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Color.fromRGBO(20, 40, 65, 1), //change your color here
                ),
                backgroundColor: Colors.amberAccent,
                centerTitle: true,
                title: Text(
                  "Change Password",
                  style: TextStyle(color: Color.fromRGBO(20, 40, 65, 1)),
                ),
              ),
              backgroundColor: Color.fromRGBO(20, 40, 65, 1),
              body: BlocProvider(
                create: (context) =>
                    UserBloc(userRepository: context.read<UserRepository>()),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      _label(),
                      SizedBox(
                        height: 50,
                      ),
                      _changePasswordForm(),
                    ]),
              ),
            )));
  }

  Widget _changePasswordForm() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
          // _showSnackBar(context, "Some error occured");
        }

        if (formStatus is SubmissionSuccess) {
          _showSnackBar(context, "Username successfully changed");
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _passwordField(),
                _newPasswordField(),
                _confirmPasswordField(),
                SizedBox(
                  height: 40,
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
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
          )),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          style: TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
              icon: ImageIcon(
                  AssetImage("assets/images/icons8-password-24.png"),
                  color: Colors.amber.shade200),
              hintText: 'Current Password',
              hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
          // validator: (value) =>
          //     state.isValidPassword ? null : 'Password is too short',
          // onChanged: (value) => context.read<UserBloc>().add(UpdatePassword(
          //     id: "to be received from session", password: value)),
          onChanged: (value) {
            setState(() {
              this.oldPassword = value;
            });
          },
        );
      },
    );
  }

  Widget _newPasswordField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: newPasswordController,
          style: TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
              icon: ImageIcon(
                  AssetImage("assets/images/icons8-password-24.png"),
                  color: Colors.amber.shade200),
              hintText: 'New Password',
              hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
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
          style: TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
              icon: ImageIcon(
                  AssetImage("assets/images/icons8-password-24.png"),
                  color: Colors.amber.shade200),
              hintText: 'Confirm New Password',
              hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
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
                    BlocProvider.of<UserBloc>(context).add(UpdatePassword(
                        oldPassword: oldPassword, newPassword: newPassword));
                    context.router.pop();
                    // _showSnackBar(context, "Success");
                  }
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   context.read<UserBloc>().add(UserSubmitted());
                  //   context.router.push(HomeRoute());
                  // }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  minimumSize: Size(200, 48),
                ),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      color: Color.fromRGBO(20, 40, 65, 1), fontSize: 20),
                ));
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
