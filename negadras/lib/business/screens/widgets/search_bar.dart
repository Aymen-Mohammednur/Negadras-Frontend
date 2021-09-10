import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              child: TextField(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter a search term'),
              ),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              // print("ontap");
            },
          )
        ],
      ),
    );
  }
}
