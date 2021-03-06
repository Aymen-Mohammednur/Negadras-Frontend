import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/app.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/screens/add_business.dart';
import 'package:negadras/business/screens/widgets.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
import 'package:negadras/category/blocs/category_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:negadras/business/screens/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget businessTypes(BuildContext context, Bloc bloc, Iterable categories) =>
      GridView.count(
        crossAxisCount: 3,
        children: _getCategoryList(categories),
      );

  List<Widget> _getCategoryList(Iterable categories) {
    DataBloc bloc = BlocProvider.of<DataBloc>(context);
    List<Widget> categoryList = [];
    categoryList.add(GestureDetector(
      onTap: () {
        context.router
            .push(FilterBusinessRoute(categoryId: "0", categoryName: "0"));
      },
      child: Container(
          decoration: gridItemDecoration(),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              'Recommended Places',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amberAccent,
              ),
            ),
          )),
          margin: EdgeInsets.all(10)),
    ));
    print(categories);

    return (categoryList +
        List.generate(
          categories.length,
          (index) {
            return GestureDetector(
                onTap: () {
                  context.router.push(FilterBusinessRoute(
                      categoryId: categories.elementAt(index).id,
                      categoryName: categories.elementAt(index).name));
                },
                child: _businessTypeContainer(index, categories));
          },
        ));
  }

  Container _businessTypeContainer(int index, Iterable categories) {
    return Container(
        decoration: gridItemDecoration(),
        child: Center(
            child: Text(
          '${categories.elementAt(index).name}',
          style: TextStyle(color: Colors.amberAccent),
        )),
        margin: EdgeInsets.all(10));
  }

  var headerText = "Available Business Categories";

  void setHeader(String s) {
    setState(() {
      headerText = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);

    if (categoryBloc.state is CategoryOperationSuccess) {
      if ((categoryBloc.state as CategoryOperationSuccess).categories.length ==
          0) {
        setHeader("No Categories Available");
      }
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 40, 65, 1),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          headerText,
          style: TextStyle(color: Color.fromRGBO(20, 40, 65, 1)),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryOperationFailed) {
            return Center(
              child: Text("Could not do category operation"),
            );
          }

          if (state is CategoryOperationSuccess) {
            return businessTypes(context, categoryBloc, state.categories);
          }

          return Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.router.push(AddBusinessRoute());
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(
      //     Icons.add,
      //     color: Color.fromRGBO(20, 40, 65, 1),
      //   ),
      //   backgroundColor: Colors.amberAccent,
      // ),
      // bottomNavigationBar: bottomNav(context, 0),
      bottomNavigationBar: ownerBottomNav(context, 0),
    );
  }
}
