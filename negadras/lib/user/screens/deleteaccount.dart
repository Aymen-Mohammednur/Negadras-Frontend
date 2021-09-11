// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/user/blocs/user_bloc.dart';
import 'package:negadras/user/data_providers/user_data_provider.dart';
import 'package:negadras/user/repository/user_repository.dart';
import 'package:auto_route/auto_route.dart';

class DeleteAccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<DeleteAccountPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  late String _typedPassword;

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
                  "Delete Account",
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
                    _deleteAccount(),
                  ],
                ),
              ),
            )));
  }

  Widget _deleteAccount() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
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
                _passwordField(),
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
            'Delete Account',
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
              hintText: 'Confirm your password to delete account',
              hintStyle: TextStyle(fontSize: 17, color: Colors.white)),
          // validator: (value) => state.isValidPassword ? null : 'Worng Password',
          // onChanged: (value) =>
          //     context.read<UserBloc>().add(DeleteUser( userid: "id form session")),
          onSaved: (value) {
            setState(() {
              this._typedPassword = value as String;
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
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   context.read<UserBloc>().add(UserSubmitted());
                  //   context.router.push(HomeRoute());
                  // }

                  final form = _formKey.currentState;
                  if (form != null && form.validate()) {
                    form.save();
                    String pass = this._typedPassword;
                    BlocProvider.of<UserBloc>(context).add(DeleteUser(pass));
                    context.router.pushAndPopUntil(SignUpRoute(),
                        predicate: (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  minimumSize: Size(200, 48),
                ),
                child: Text(
                  "Delete Account",
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
