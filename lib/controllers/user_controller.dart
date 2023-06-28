// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud/models/user_model.dart';

final CollectionReference _user =
    FirebaseFirestore.instance.collection("users");

class user_controller {
  Future add_user(user_model user) async {
    await _user.doc().set(user.add_data());
  }

  Future update_user(user_model user) async {
    await _user.doc().update(user.add_data());
  }

  Future delete_user(user_model user) async {
    await _user.doc(user.id).delete();
  }
}
