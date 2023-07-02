// ignore_for_file: unused_field, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_crud/controllers/user_controller.dart';
import 'package:flutter_crud/models/user_model.dart';

import '../components/mytextfield.dart';

class ManageUser extends StatefulWidget {
  final user_model? user;
  final index;
  const ManageUser({super.key, this.user, this.index});

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  final _form_key = GlobalKey<FormState>();

  bool isEditingMode = false;

  final TextEditingController id = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  void initState() {
    if (widget.index != null) {
      isEditingMode = true;
      id.text = widget.user?.id;
      name.text = widget.user?.name;
      email.text = widget.user?.email;
      address.text = widget.user?.address;
    } else {
      isEditingMode = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditingMode == true
            ? const Text("Edit User")
            : const Text("Add User"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Center(
                child: isEditingMode == true
                    ? const Text(
                        "Edit User",
                        style: TextStyle(fontSize: 28),
                      )
                    : const Text(
                        "Add User",
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
                    // _form_key.currentState!.save();

                    if (isEditingMode == true) {
                      user_controller().update_user(user_model(
                          id: id.text,
                          name: name.text,
                          email: email.text,
                          address: address.text));
                    } else {
                      user_controller().add_user(user_model(
                          name: name.text,
                          email: email.text,
                          address: address.text));
                    }
                  }
                  Navigator.pop(context);
                },
                child: isEditingMode == true
                    ? const Text('Update')
                    : const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
