import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/repository/auth_repository.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/auth/signup/bloc/sign_up_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:negadras/routes/router.gr.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => AuthRepository(AuthDataProvider(http.Client())),
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                SignUpBloc(authRepo: context.read<AuthRepository>()),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _label(),
                _signUpForm(),
                _showLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return BlocListener<SignUpBloc, SignUpState>(
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
                _firstnameField(),
                _lastnameField(),
                _usernameField(),
                // _emailField(),
                _passwordField(),
                _confirmPasswordField(),
                SizedBox(
                  height: 10,
                ),
                _signUpButton(),
              ],
            )),
      ),
    );
  }

  Widget _label() {
    return SafeArea(
      child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 5),
          child: Text(
            'Create Account',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          )),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          controller: usernameController,
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: 'Username'),
          validator: (value) =>
              state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _firstnameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          controller: firstNameController,
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: 'First name'),
          validator: (value) =>
              state.isValidFirstname ? null : 'First name is too short',
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpFirstnameChanged(firstname: value)),
        );
      },
    );
  }

  Widget _lastnameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          controller: lastNameController,
          decoration:
              InputDecoration(icon: Icon(Icons.person), hintText: 'Last name'),
          validator: (value) =>
              state.isValidLastname ? null : 'Last name is too short',
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpLastnameChanged(lastname: value)),
        );
      },
    );
  }

  Widget _emailField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'Email',
        ),
        validator: (value) => state.isValidEmail ? null : 'Invalid email',
        onChanged: (value) => context.read<SignUpBloc>().add(
              SignUpEmailChanged(email: value),
            ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration:
              InputDecoration(icon: Icon(Icons.security), hintText: 'Password'),
          validator: (value) =>
              state.isValidPassword ? null : 'Password is too short',
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _confirmPasswordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.security), hintText: 'Confirm Password'),
          validator: (value) =>
              state.isValidConfirmPassword ? null : 'Password don\'t match',
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpConfirmPasswordChanged(confirmPassword: value)),
        );
      },
    );
  }

  Widget _signUpButton() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignUpBloc>().add(SignUpSubmitted());
                    context.router.push(LoginRoute());
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black87)),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ));
      },
    );
  }

  Widget _showLoginButton() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: TextButton(
          onPressed: () {
            context.router.push(LoginRoute());
          },
          child: Text(
            'Already have an account? Sign in.',
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
