import 'package:authentification/signup.dart';
import 'package:flutter/material.dart';

class AllUsersPage extends StatefulWidget {
  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Users Allowed'), centerTitle: true),
    );
  }
}
