import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentification/Login.dart';
import 'package:authentification/adminonly.dart';
import 'package:authentification/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:authentification/adminonly.dart';

import 'Start.dart';

class UserManagement {
  // get email => null;

  // get password => null;

  Widget handleAuth() {
    // ignore: unnecessary_new
    return new StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return DashboardPage();
        }
        return Start();
      }),
    );
  }

  authorizeAccess(BuildContext context) async {
    User? user = await FirebaseAuth.instance.currentUser;
    {
      FirebaseFirestore.instance
          .collection('/users')
          .where('uid', isEqualTo: user?.uid)
          .get()
          .then((results) {
        if (results.size > 0) {
          if (results.docs[0].data()['role'] == 'admin') {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new DashboardPage()));
          }
        }

        signOut() {
          FirebaseAuth.instance.signOut();
        }
      });
    }
    ;
  }

  void signOut() {}

  //       } else {
  //         print('Not Authorized');
  //       }
  //     }

  // FirebaseAuth.instance.currentUser.then((user) {
  //   FirebaseFirestore.instance
  //       .collection('/users')
  //       .where('uid', isEqualTo: user.uid)
  //       .getDocuments()
  //       .then((docs) {
  //     if (docs.documents[0].exists) {
  //       if (docs.documents[0].data['role'] == 'admin') {
  //         Navigator.of(context).push(
  //             MaterialPageRoute(builder: (context) => new AdminPage()));
  //       } else {
  //         print('Not Authorized');
  //       }
  //     }
  //   });
  // });
}
