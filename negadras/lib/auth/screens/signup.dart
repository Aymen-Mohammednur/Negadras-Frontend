// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/auth/Constants/constants.dart';
import 'package:negadras/auth/blocs/auth_bloc.dart';
import 'package:negadras/auth/blocs/auth_event.dart';
import 'package:negadras/auth/models/models.dart';
import 'package:negadras/routes/router.gr.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _register = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
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
                      'Sign Up to Negadras',
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
                      return 'Please enter First Name';
                    }
                    return null;
                  },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                    onSaved:(value){
                      setState((){
                        this._register[StringConstants.FIRSTNAME] = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                    onSaved:(value){
                      setState((){
                        this._register[StringConstants.LASTNAME] = value;
                      });
                    },
                  ),
                ),
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
                      labelText: 'Username',
                    ),
                    onSaved:(value){
                      setState((){
                        this._register[StringConstants.USERNAME] = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Please enter password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onSaved:(value){
                      setState((){
                        this._register[StringConstants.PASSWORD] = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Please enter confirm password';
                      }else if(value == _register[StringConstants.CPASSWORD]){
                        return 'Please enter similar password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                    onSaved:(value){
                      setState((){
                        this._register[StringConstants.CPASSWORD] = value;
                      });
                    },
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20,color:Colors.white),onSurface: Colors.blue),
                        child: Text(StringConstants.SIGNUP),
                        onPressed: () {
                          print("register pressed");
                          final form = _formKey.currentState;
                          if (form != null && form.validate()) {
                            print("register validation passed");
                            form.save();
                            final RegisterEvent event = RegisterCreate(
                                Register(firstname: this
                                    ._register[StringConstants.FIRSTNAME],
                                    lastname: this._register[StringConstants
                                        .LASTNAME],
                                    username: this._register[StringConstants
                                        .USERNAME],
                                    password: this._register[StringConstants
                                        .PASSWORD])
                            );
                            print("about to start an event");
                            BlocProvider.of<RegisterBloc>(context).add(event);
                            context.router.push(SignInRoute());
                          }
                        },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Already have an account?'),
                        TextButton(
                          style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.blue)),
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            context.router.push(SignInRoute());
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],)
            )));
  }
}
