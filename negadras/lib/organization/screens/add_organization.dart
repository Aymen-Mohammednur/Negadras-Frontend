import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/auth/login/bloc/login_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:negadras/organization/bloc/organization_bloc.dart';
import 'package:negadras/organization/data_providers/organization_data_provider.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:negadras/organization/repository/organization_repository.dart';
import 'package:negadras/routes/router.gr.dart';

class AddOrganizationPage extends StatefulWidget {
  AddOrganizationPage({Key? key}) : super(key: key);

  @override
  _AddOrganizationPageState createState() => _AddOrganizationPageState();
}

class _AddOrganizationPageState extends State<AddOrganizationPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController organizationNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RepositoryProvider(
            create: (context) =>
                OrganizationRepository(OrganizationDataProvider()),
            child: Scaffold(
              body: BlocProvider(
                create: (context) => OrganizationBloc(
                    orgRepo: context.read<OrganizationRepository>()),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _label(),
                    _addOrganizationForm(),
                  ],
                ),
              ),
            )));
  }

  Widget _addOrganizationForm() {
    return BlocListener<OrganizationBloc, OrganizationState>(
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
                _orgnameField(),
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
            'Add Organization',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          )),
    );
  }

  Widget _orgnameField() {
    return BlocBuilder<OrganizationBloc, OrganizationState>(
      builder: (context, state) {
        return TextFormField(
          controller: organizationNameController,
          decoration: InputDecoration(
              icon: Icon(Icons.account_balance),
              hintText: 'Organization Name: '),
          validator: (value) =>
              state.isValidUsername ? null : 'Organization Name is too short',
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _submitButton() {
    return BlocBuilder<OrganizationBloc, OrganizationState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<OrganizationBloc>().add(OrganizationSubmitted(
                        Organization(id: '', name: state.organizationName)));
                    context.router.push(HomeRoute());
                  }
                },
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87)),
                child: Text(
                  "Login",
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
