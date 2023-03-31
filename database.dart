import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:authentification/user.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference UserProfile =
      FirebaseFirestore.instance.collection("Users");

  Future UpdateUserData(String firstname, String lastname, int contactno,
      String city, String address) async {
    return await UserProfile.doc(uid).set({
      'First name': firstname,
      'Last name': lastname,
      'Contact no': contactno,
      'city': city,
      'Address': address,
    });
  }

  // user profile list from snapshot
  List<Userprofiles> _userProfileListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Userprofiles(
          uid: doc.get('uid'),
          firstname: doc.get('First name') ?? '',
          lastname: doc.get('Last name') ?? '',
          contact: doc.get('Contact') ?? '',
          address: doc.get('Address') ?? '',
          city: doc.get('city') ?? '');
    }).toList();
  }

  /* Userprofiles _UserProfileDataFromSnapshot(DocumentSnapshot snapshot){
    return Userprofiles(
      uid: uid ?? '',
      firstname: snapshot.data()['First name'] ?? '',
      lastname: snapshot.data()['Last name'],
        contact: snapshot.data['Contact'],
        address: snapshot.data['Address'],
        city: snapshot.data['City']
    );
  }*/

  Stream<List<Userprofiles>> get profiles {
    return UserProfile.snapshots().map(_userProfileListFromSnapShot);
  }

  //Stream<Userprofiles> get userData {
  //return UserProfile.doc(uid).snapshots().map(_userProfileListFromSnapShot);
  //}
}
