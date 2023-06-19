import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_user.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    const users = {...dummy_users};

    return Scaffold(
      appBar: AppBar(
        title: const Text('User list'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, i) => Text(users.elementAt(i).name),
      ),
    );
  }
}
