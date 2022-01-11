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
  Widget businessType(BuildContext context, Bloc bloc, Iterable categories) =>
      GridView.count(
        crossAxisCount: 3,
        children: _getCategoryList(categories),
      );

  List<Widget> _getCategoryList(Iterable categories) {
    DataBloc bloc = BlocProvider.of<DataBloc>(context);
    print("HAHAHAHAHA");
    print(bloc.state.userId);
    List<Widget> categoryList = [];
    categoryList.add(
      GestureDetector(
            onTap: () {
              context.router.push(FilterBusinessRoute(
                  categoryId:"0",
                  categoryName: "0"));
            },
            child: Container(
        decoration: gridItemDecoration(),
        child: Center(
            child: Text(
          'Your Recommendations',
          style: TextStyle(color: Colors.amberAccent),
        )),
        margin: EdgeInsets.all(10)),
    ));

    return (categoryList + List.generate(
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
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Negadras",
          style: TextStyle(color: Color.fromRGBO(20, 40, 65, 1)),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          print(state);

          if (state is CategoryOperationFailed) {
            return Center(
              child: Text("Could not do category operation"),
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
                    child: Text("What are you looking for...",
                        style: normalText()),
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
              color: Colors.black,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(AddBusinessRoute());
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Color.fromRGBO(20, 40, 65, 1),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      // bottomNavigationBar: bottomNav(context, 0),
      bottomNavigationBar: ownerBottomNav(context, 0),
    );
  }
}
