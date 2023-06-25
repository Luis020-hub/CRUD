import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_user.dart';
import 'package:flutter_crud/models/user.dart';

class UsersProvider with ChangeNotifier {
  final Set<User> _items = {...dummy_users};

  List<User> get all {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.elementAt(i);
  }
}
