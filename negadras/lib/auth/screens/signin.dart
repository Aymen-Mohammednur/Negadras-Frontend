// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/auth/Constants/constants.dart';
import 'package:negadras/auth/blocs/auth_bloc.dart';
import 'package:negadras/auth/blocs/auth_event.dart';
import 'package:negadras/auth/models/login.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _login = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.SIGNIN),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child:ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        StringConstants.SIGNIN_NEGADRAS,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value){
                        if(value != null && value.isEmpty){
                          return 'Please enter username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: StringConstants.USERNAME,
                      ),
                      onSaved:(value){
                        setState((){
                          this._login[StringConstants.USERNAME] = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value){
                        if(value != null && value.isEmpty){
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: StringConstants.PASSWORD,
                      ),
                      onSaved:(value){
                        setState((){
                          this._login[StringConstants.PASSWORD] = value;
                        });
                      },
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20,color:Colors.white),onSurface: Colors.blue),
                        child: Text(StringConstants.SIGNIN),
                        onPressed: () {
                          print("login pressed");
                          final form = _formKey.currentState;
                          print(form);
                          if (form != null && form.validate()){
                            print("login validation passed");
                            form.save();
                            final LoginEvent event = LoginRead(
                                Login(username:this._login[StringConstants.USERNAME],password:this._login[StringConstants.PASSWORD])
                            );
                            print("about to start an event");
                            BlocProvider.of<LoginBloc>(context).add(event);
                            context.router.push(HomeRoute());
                          }
                        },
                      )),
                  Container(
                      child: Row(
                        children: <Widget>[
                          Text('Does not have account?'),
                          TextButton(
                            style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.blue)),
                            child: Text(
                              StringConstants.SIGNUP,
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              //signup screen
                              context.router.push(SignUpRoute());
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              )
            )));
  }
}
