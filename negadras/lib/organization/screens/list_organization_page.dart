import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/business/screens/widgets.dart';
import 'package:negadras/organization/bloc/organization_bloc.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';

class ListOrganizationPage extends StatefulWidget {
  ListOrganizationPage({Key? key}) : super(key: key);

  @override
  _ListOrganizationPageState createState() => _ListOrganizationPageState();
}

class _ListOrganizationPageState extends State<ListOrganizationPage> {
  Row singleOrgEntry(String organizationName, int i) {
    return Row(children: [
      Expanded(
        child: Text(
          "$organizationName $i",
          style: normalText(),
        ),
      ),
      GestureDetector(onTap: () {}, child: Icon(Icons.delete)),
      GestureDetector(onTap: () {}, child: Icon(Icons.edit))
    ]);
  }

  ListView getLV() {
    return ListView.builder(itemBuilder: (context, i) {
      return Container(
          height: 40,
          decoration: listItemDecoration(),
          child: singleOrgEntry("Organization", i),
          padding: EdgeInsets.only(left: 15, right: 15),
          margin: EdgeInsets.only(bottom: 5, top: 5, left: 13, right: 13));
    });
  }

  // takes params
  ListView getListView(List<Organization>? orgs) {
    return ListView.builder(
        itemCount: orgs!.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {},
            child: Container(
                height: 40,
                decoration: listItemDecoration(),
                child: singleOrgEntry(orgs[i].name, i),
                padding: EdgeInsets.only(left: 15, right: 15),
                margin:
                    EdgeInsets.only(bottom: 5, top: 5, left: 13, right: 13)),
          );
        });
  }

  Widget switchButton =
      ElevatedButton(onPressed: () {}, child: Text("My Businesses"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(context),
      body: BlocBuilder<OrganizationBloc, OrganizationState>(
        builder: (context, orgState) {
          if (orgState.formStatus is SubmissionFailed) {
            return Center(child: Text("Could not fetch organizations."));
          }
          if (orgState.formStatus is SubmissionSuccess) {
            return Center(
              child: Column(
                children: [
                  switchButton,
                  Container(
                      child: getListView(orgState.organizations),
                      width: 400,
                      height: 700),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
