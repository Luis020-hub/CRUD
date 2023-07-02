// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.labeledtext,
    this.hintedtext,
    required this.mycontroller,
  });

  final TextEditingController mycontroller;
  final labeledtext, hintedtext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return "The $labeledtext is required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labeledtext,
        hintText: hintedtext,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
      ),
    );
  }
}
