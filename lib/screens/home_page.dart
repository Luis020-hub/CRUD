// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud/controllers/user_controller.dart';
import 'package:flutter_crud/models/user_model.dart';
import 'package:flutter_crud/screens/add_or_edit_user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _Users =
      FirebaseFirestore.instance.collection("Users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const ManageUser())));
        },
        child: const Icon(Icons.person),
      ),
      appBar: AppBar(
        title: const Text('User list'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: StreamBuilder(
                  stream: _Users.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      );
                    }
                    if (snapshots.hasData) {
                      return ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot records =
                              snapshots.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Slidable(
                              startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      final user = user_model(
                                        id: records.id,
                                        name: records["name"],
                                        email: records["email"],
                                        address: records["address"],
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => ManageUser(
                                                user: user,
                                                index: index,
                                              )),
                                        ),
                                      );
                                    },
                                    icon: Icons.edit_note,
                                    backgroundColor: Colors.blue,
                                  )
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      user_controller().delete_user(
                                          user_model(id: records.id));
                                    },
                                    icon: Icons.delete_outline,
                                    backgroundColor: Colors.red,
                                  )
                                ],
                              ),
                              child: ListTile(
                                tileColor: Colors.greenAccent,
                                title: Text(records["name"]),
                                subtitle: Text(records["email"]),
                              ),
                            ),
                          );
                        },
                      );
                    } else {}
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
