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
                _label(),
                _passwordField(),
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
            'Delete Account',
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
          decoration:
              InputDecoration(icon: Icon(Icons.security), hintText: 'Password'),
          validator: (value) => state.isValidPassword ? null : 'Worng Password',
          // onChanged: (value) =>
          //     context.read<UserBloc>().add(DeleteUser( userid: "id form session")),
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<UserBloc>().add(UserSubmitted());
                    context.router.push(HomeRoute());
                  }
                },
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87)),
                child: Text(
                  "Delete Account",
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
