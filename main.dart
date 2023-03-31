import 'package:authentification/Login.dart';
import 'package:authentification/Register.dart';
import 'package:authentification/Start.dart';
import 'package:authentification/finaldashboard.dart';
import 'package:authentification/user.dart';
import 'package:authentification/usermanagement.dart';
import 'package:authentification/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentification/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentification/usermanagement.dart';

import 'authenticate.dart';

//void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<ThisUser?>.value(
          catchError: (_, __) => null,
          initialData: null,
          value: AuthService().user,
        ),
        StreamProvider<Userprofiles?>.value(
          catchError: (_, __) => null,
          initialData: null, value: null,
          //value: AuthService().user,)
        )
      ],
      child: MaterialApp(
        //home: RegisterScreen(),
        home: Start(),
        //home: UserManagement().handleAuth(),
      ),
    );
  }
}
