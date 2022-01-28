import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class SearchBar extends StatefulWidget {
  String? categoryId;
  SearchBar({Key? key, this.categoryId}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late String _input;

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    // late String _input;
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              child: TextFormField(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                onChanged: (value) {
                  setState(() {
                    this._input = value;
                    businessBloc.add(SearchBusinessEvent(
                        widget.categoryId as String, value));
                    // context.router.popAndPush(FilterBusinessRoute(queryParameter: value, categoryId: widget.categoryId));
                  });
                  // setState(() {
                  //   this._input = value;
                  // });
                },

                // onSaved: (value) {
                //   setState(() {
                //     businessBloc.add(SearchBusinessEvent(widget.categoryId as String, value!));
                //     // context.router.popAndPush(FilterBusinessRoute(queryParameter: value, categoryId: widget.categoryId));
                //   });
                // },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter a search term'),
              ),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              // // print("ontap");
              setState(() {
                businessBloc.add(
                    SearchBusinessEvent(widget.categoryId as String, _input));
                // context.router.popAndPush(FilterBusinessRoute(queryParameter: value, categoryId: widget.categoryId));
              });
            },
          )
        ],
      ),
    );
  }
}
