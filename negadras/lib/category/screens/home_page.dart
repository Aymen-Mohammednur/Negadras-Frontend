import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Widget businessType(BuildContext context, Bloc bloc, Iterable categories) =>
      GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          categories.length,
          (index) {
            return GestureDetector(
                onTap: () {
                  // bloc.add(CategoryFilter(
                  //     categoryId: categories.elementAt(index).id));

                  context.router.push(FilterBusinessRoute(
                      categoryId: categories.elementAt(index).id));
                },
                onDoubleTap: () => setText(""),
                child: _businessTypeContainer(index, categories));
          },
        ),
      );

  Container _businessTypeContainer(int index, Iterable categories) {
    return Container(
        decoration: gridItemDecoration(),
        child: Center(
            child: Text(
          '${categories.elementAt(index).name}',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.amberAccent),
        )),
        margin: EdgeInsets.all(10));
  }

  String textString = "";

  void setText(String s) {
    textString = s;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 40, 65, 1),

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 40, 65, 1),
        title: Text(
          "Negadras",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Colors.amberAccent),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          print(state);

          if (state is CategoryOperationFailed) {
            return Center(
              child: Text(
                "Could not do category operation",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.amberAccent),
              ),
            );
          }

          if (state is CategoryOperationSuccess) {
            final categories = state.categories;

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SearchBar(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      "What are you looking for...",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.amberAccent),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: businessType(context, categoryBloc, categories)),
                  // Expanded(
                  //   flex: 1,
                  //   child: Center(child: Text(textString)),
                  // )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Colors.amberAccent,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(ListOrganizationRoute());
        },
        tooltip: 'Add Business',
        child: Icon(Icons.add),
        backgroundColor: Colors.green.shade900,
      ),
      // bottomNavigationBar: bottomNav(context, 0),
      bottomNavigationBar: ownerBottomNav(context, 0),
    );
  }
}
