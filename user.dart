class ThisUser {
  final String? uid;

  ThisUser({this.uid});
}

class Userprofiles {
  final String uid;
  final String firstname;
  final String lastname;
  final String contact;
  final String address;
  final String city;

  Userprofiles(
      {required this.uid,
      required this.firstname,
      required this.lastname,
      required this.contact,
      required this.address,
      required this.city});
}
