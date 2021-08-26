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
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter a search term'),
              ),
            ),
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
