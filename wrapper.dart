import 'package:authentification/Start.dart';
import 'package:authentification/finaldashboard.dart';
import 'package:authentification/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ThisUser?>(context);
    if (user == null) {
      return Start();
    } else {
      return finaldashboard();
    }
  }
}
