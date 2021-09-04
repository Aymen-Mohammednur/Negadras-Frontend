import 'package:flutter/material.dart';

Widget buildName(name) {
  return TextFormField(
    decoration: InputDecoration(labelText: "Name"),
    maxLength: 50,
    validator: (String? value) {
      if (value!.isEmpty) {
        return 'Name is required';
      }

      // return null;
    },
    onSaved: (String? value) {
      name = value!;
    },
  );
}
