import 'package:authentification/user.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  final Userprofiles? getprofiles;
  Profilepage({this.getprofiles});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Card(
        child: Column(
          children: [
            Row(
              children: [Text('First name'), Text(getprofiles!.firstname)],
            ),
            Row(
              children: [Text('Last name'), Text(getprofiles!.lastname)],
            )
          ],
        ),
      ),
    );
  }
}
