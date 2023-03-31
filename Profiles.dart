import 'package:flutter/material.dart';
import 'package:authentification/user.dart';
import 'package:provider/provider.dart';

class Profileslist extends StatefulWidget {
  @override
  _ProfileslistState createState() => _ProfileslistState();
}

class _ProfileslistState extends State<Profileslist> {
  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<List<Userprofiles>>(context);
    if (usersData != null) {
      usersData.forEach((userdata) {
        print(userdata.firstname);
        print(userdata.lastname);
      });
    }

    return Container();
  }
}
