import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/organization/form_submission_status.dart';
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
  late String _organization;

  TextEditingController organizationNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 40, 65, 1),
        title: Text("Add an Organization",
            style: TextStyle(color: Colors.amberAccent)),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // _label(),
          _addOrganizationForm(),
        ],
      ),
    );
    ;
  }

  Widget _addOrganizationForm() {
    return BlocListener<OrganizationBloc, OrganizationState>(
      listener: (context, state) {
        // final formStatus = state.formStatus;
        if (state is OrganizationOperationFailure) {
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
              hintText: 'Organization Name '),
          validator: (value) {
            if (value!.isEmpty) {
              return "Name is required";
            }
            return null;
          },
          // onChanged: (value) => context
          //     .read<OrganizationBloc>()
          //     .add(OrganizationNameChanged(organizationName: value)),
          onSaved: (value) {
            setState(() {
              this._organization = value!;
            });
          },
        );
      },
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //   _formKey.currentState!.save();
        //   final organization =
        //       Organization(id: '', name: state.organizationName);
        //   context
        //       .read<OrganizationBloc>()
        //       .add(OrganizationSubmitted(organization));
        //   context.router.push(ListOrganizationRoute());
        // }
        final form = _formKey.currentState;
        if (form != null && form.validate()) {
          form.save();
          final OrganizationEvent event = OrganizationCreate(
            Organization(
              id: "",
              name: _organization,
            ),
          );
          BlocProvider.of<OrganizationBloc>(context).add(event);
          context.router.popAndPush(ListOrganizationRoute());
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(20, 40, 65, 1),
        minimumSize: Size(150, 35),
      ),
      child: Text(
        "Add Organization",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
