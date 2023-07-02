// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    this.labeledtext,
    this.hintedtext,
    required this.mycontroller,
  });

  final TextEditingController mycontroller;
  final labeledtext, hintedtext;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.mycontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return "The ${widget.labeledtext} is required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.labeledtext,
        hintText: widget.hintedtext,
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
