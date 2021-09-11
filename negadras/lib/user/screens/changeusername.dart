import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/user/form_submission_status.dart';
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

  late String newUsername;

  String passedId = "6134db2369ba186847c14dba";

  TextEditingController newUsernameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

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
                  "Change Username",
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
          // _showSnackBar(context, "Some error occured");
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
                _newUsernameField(),
                SizedBox(
                  height: 30,
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
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
          )),
    );
  }

  Widget _newUsernameField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: newUsernameController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: ImageIcon(
                AssetImage("assets/images/icons8-person-24.png"),
                color: Colors.amber.shade200,
              ),
              hintText: 'New Username',
              hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
          // validator: (value) =>
          //     state.isValidUsername ? null : 'Username is too short',
          // onChanged: (value) => context.read<UserBloc>().add(UpdateUsername(
          //     id: "to be received from session", username: value)),
          onChanged: (value) {
            setState(() {
              this.newUsername = value;
            });
          },
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TextFormField(
          controller: usernameController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: ImageIcon(
                AssetImage("assets/images/icons8-person-24.png"),
                color: Colors.amber.shade200,
              ),
              hintText: 'Current Username',
              hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
          // validator: (value) =>
          //     state.isValidUsername ? null : 'Username is too short',
          // onChanged: (value) => context.read<UserBloc>().add(UpdateUsername(
          //     id: "to be received from session", username: value)),
          // onChanged: (value) {
          //   setState(() {
          //     this.newUsername = value;
          //   });
          // },
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
                        .add(UpdateUsername(username: newUsername));
                  }
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   context.read<UserBloc>().add(UserSubmitted());
                  //   // context.router.push(HomeRoute());
                  // }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  minimumSize: Size(200, 48),
                ),
                child: Text(
                  "Change Username",
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
