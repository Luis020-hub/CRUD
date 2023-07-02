// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_crud/controllers/user_controller.dart';
import 'package:flutter_crud/models/user_model.dart';

import '../components/mytextfield.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({super.key});

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  final _form_key = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  "Add user",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _form_key,
                  child: Column(
                    children: [
                      MyTextField(
                        hintedtext: "Your full name",
                        labeledtext: "Name",
                        mycontroller: name,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtext: "Your email",
                        labeledtext: "Email",
                        mycontroller: email,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        hintedtext: "Your address",
                        labeledtext: "Address",
                        mycontroller: address,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_form_key.currentState!.validate()) {
                    _form_key.currentState!.save();
                    user_controller().add_user(user_model(
                        name: name.text,
                        email: email.text,
                        address: address.text));
                  }
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
