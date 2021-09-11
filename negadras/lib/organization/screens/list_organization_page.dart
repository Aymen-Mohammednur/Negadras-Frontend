import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/app.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/business/screens/widgets.dart';
import 'package:negadras/organization/bloc/organization_bloc.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import 'package:auto_route/auto_route.dart';

class ListOrganizationPage extends StatefulWidget {
  ListOrganizationPage({Key? key}) : super(key: key);

  @override
  _ListOrganizationPageState createState() => _ListOrganizationPageState();
}

class _ListOrganizationPageState extends State<ListOrganizationPage> {
  // Row singleOrgEntry(String organizationName) {
  //   return Row(children: [
  //     Expanded(
  //       child: Text(
  //         "$organizationName",
  //         style: normalText(),
  //       ),
  //     ),
  //     GestureDetector(onTap: () {}, child: Icon(Icons.edit)),
  //     SizedBox(width: 4),
  //     GestureDetector(onTap: () {}, child: Icon(Icons.delete))
  //   ]);
  // }

  // ListView getLV() {
  //   return ListView.builder(itemBuilder: (context, i) {
  //     return Container(
  //         height: 40,
  //         decoration: listItemDecoration(),
  //         child: singleOrgEntry("Organization"),
  //         padding: EdgeInsets.only(left: 15, right: 15),
  //         margin: EdgeInsets.only(bottom: 5, top: 5, left: 13, right: 13));
  //   });
  // }

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
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        orgs[i].name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // GestureDetector(
                    //     onTap: () {},
                    //     child: Icon(Icons.edit, color: Colors.green.shade900)),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.green.shade900),
                        onPressed: () => {
                          context.router.popAndPush(
                              EditOrganizationRoute(organization: orgs[i]))
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.green.shade900),
                        onPressed: () => {
                          BlocProvider.of<OrganizationBloc>(context)
                              .add(OrganizationDelete(orgs[i].id)),
                          context.router.popAndPush(ListOrganizationRoute())
                        },
                      ),
                    ),

                    // SizedBox(width: 10),
                    // GestureDetector(
                    //     onTap: () {},
                    //     child: Icon(Icons.delete, color: Colors.green.shade900))
                  ],
                ),
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
      backgroundColor: Color.fromRGBO(20, 40, 65, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 40, 65, 1),
        title: Text(
          "Your Organizations",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Colors.amberAccent),
        ),
        centerTitle: true,
      ),
      // bottomNavigationBar: bottomNav(context, 0),
      bottomNavigationBar: ownerBottomNav(context, 2),
      body: BlocBuilder<OrganizationBloc, OrganizationState>(
        builder: (context, orgState) {
          print(orgState);
          if (orgState is OrganizationOperationFailure) {
            return Center(
                child: Text(
              "Could not fetch organizations.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.amberAccent),
            ));
          }

          if (orgState is NoOrganizationsState) {
            return Center(
                child: Text(
              "You have no organizations. Click the '+' button to add one.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.amberAccent),
            ));
          }
          if (orgState is OrganizationOperationSuccess) {
            return Center(
              child: Column(
                children: [
                  switchButton,
                  Expanded(
                    child: Container(
                      child: getListView(orgState.organizations),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(
            color: Colors.amberAccent,
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.popAndPush(AddOrganizationRoute());
        },
        tooltip: 'Add Organization',
        child: Icon(
          Icons.add,
          color: Colors.amberAccent,
        ),
        backgroundColor: Colors.green.shade900,
      ),
    );
  }
}
