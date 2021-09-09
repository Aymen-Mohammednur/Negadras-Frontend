
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/user/blocs/user_bloc.dart';
import 'package:negadras/user/data_providers/user_data_provider.dart';

import 'package:negadras/user/repository/user_repository.dart';

import 'package:auto_route/auto_route.dart';

class ChangeUsernamePage extends StatefulWidget {
  ChangeUsernamePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsernamePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController newUsernameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

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
                    _changeUsernameForm(),
                  ],
                ),
              ),
            )));
  }

  Widget _changeUsernameForm() {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
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
                _usernameField(),
                _newUsernameField(),
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
            'Change your Username',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          )),
    );
  }

  Widget _newUsernameField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: newUsernameController,
          decoration: InputDecoration(
              icon: Icon(Icons.person), hintText: 'New Username'),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) => context.read<UserBloc>().add(UpdateUsername(
              id: "to be received from session", username: value)),
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
              icon: Icon(Icons.person), hintText: 'Current Username'),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) => context.read<UserBloc>().add(UpdateUsername(
              id: "to be received from session", username: value)),
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
                  "Change Username",
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
