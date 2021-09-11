import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/repository/auth_repository.dart';

import 'package:negadras/auth/signup/bloc/sign_up_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:negadras/routes/router.gr.dart';

class GetStartedPage extends StatefulWidget {
  GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RepositoryProvider(
        create: (context) => AuthRepository(AuthDataProvider(http.Client())),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(20, 40, 65, 1),
          body: BlocProvider(
            create: (context) =>
                SignUpBloc(authRepo: context.read<AuthRepository>()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_label(), _signUpButton(), _loginButton()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label() {
    return SafeArea(
      child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 5),
          child: Text(
            'Hello.',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 50,
                color: Colors.amberAccent),
          )),
    );
  }

  Widget _signUpButton() {
    return ElevatedButton(
        onPressed: () {
          context.router.push(SignUpRoute());
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.amberAccent,
          minimumSize: Size(200, 48),
        ),
        // style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.all(Colors.black87)),
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }

  Widget _loginButton() {
    return ElevatedButton(
        onPressed: () {
          context.router.push(LoginRoute());
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
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}
