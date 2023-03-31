import 'package:authentification/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ThisUser? _fromFirebase(User user) {
    return ThisUser != null ? ThisUser(uid: user.uid) : null;
  }

  Stream<ThisUser?> get user {
    return _auth.authStateChanges().map((User? user) => _fromFirebase(user!));
  }

// signin Anonymously
  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //Signin with email and password

  Future signinWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _fromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
// get current user Id

  //Future <String> getCurrentUser()async {
  //return (await _auth.currentUser()).uid;
  //}
// register using email and password

  Future ResgisterUsingEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password); //.then((value) async {
      //await updateUserName(name, result.user!);
      //var userUpdateInfo = new UserUpdateInfo(); //create user update object
      //userUpdateInfo.displayName = "John Doe";
      //await value.user.updateProfile(userUpdateInfo); //update to firebase
      //await value.user.reload();
      //});

      //await updateUserName(name, result.user!);
      User? user = result.user;

      // create a new document for the user with uid
      await DatabaseService(uid: user!.uid)
          .UpdateUserData('Paul', 'Heyman', 123456780, 'Karachi', 'A-105');

      return _fromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Future updateUserName(String name, User user) async {
  //var userUpdateInfo = _fromFirebase(user!);
  //userUpdateInfo.displayName = name;
  //}
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
