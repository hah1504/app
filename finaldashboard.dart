import 'package:authentification/authenticate.dart';
import 'package:authentification/profilepage.dart';
import 'package:authentification/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'dart:ui' as ui;
import 'database.dart';

class finaldashboard extends StatelessWidget {
  //final int items = 6;
  //final Userprofiles userprofile;
  //final ThisUser thisuser;
  //finaldashboard({required this.userprofile, required this.thisuser});

  void getGrocery() async {
    var response = await Dio().post('https://texpo.tdap.gov.pk/');
    print(response);
  }
  // var items = [
  //PlaceInfo("Dubai Mall food court", Color(0xFFBDBDBD), Color(0xFFBDBDBD)),

  //PlaceInfo("hello", Color(0xFFBDBDBD), Color(0xFFBDBDBD) ),
  //PlaceInfo("hello2"),
  //PlaceInfo("hello3")
  //
  final AuthService _auth = AuthService();
  final DatabaseService _database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<List<Userprofiles>>(context);
    getGrocery();
    return StreamProvider<List<Userprofiles>>.value(
      value: DatabaseService().profiles,
      initialData: const [],
      child: Scaffold(
        drawer: NavigationDrawerWidget(userprofile: usersData.first),
        appBar: AppBar(
          title: const Text("Welcome"),
          actions: [],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 12.0,
                  ),
                  // Padding(padding: EdgeInsets.symmetric(horizontal: 24.0)),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_sharp),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                        //contentPadding: EdgeInsets.all(8.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.teal),
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFBDBDBD)))
                        //icon: new Icon(Icons.search_sharp)
                        ),
                  ),
                  Container(
                    //color: Colors.teal,
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(20.0)),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Dairy Products',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                  ),
                  Container(
                    //color: Colors.teal,
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(20.0)),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Grocery ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                  ),
                  InkWell(
                    onTap: () {},
                  ),

                  Container(
                    //color: Colors.teal,
                    height: 120.0,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/TDAP-Logo-PNG-150x150.png'),
                            fit: BoxFit.fitHeight),
                        //shape: BoxShape.circle,
                        color: Colors.teal,
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(20.0)),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Other Items ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final Color endColor;
  final Color startColor;

  PlaceInfo(this.name, this.endColor, this.startColor);
}

class NavigationDrawerWidget extends StatefulWidget {
  final Userprofiles userprofile;
  NavigationDrawerWidget({required this.userprofile});
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //final usersData = Provider.of<List<Userprofiles>>(context);
    const name = 'name';
    const email = 'email';
    return StreamProvider<List<Userprofiles>>.value(
      value: DatabaseService().profiles,
      initialData: [],
      child: Drawer(
        child: Material(
          color: Colors.deepOrange,
          child: ListView(
            padding: padding,
            children: <Widget>[
              buildHeader(name: name, email: email, onClicked: () {}),
              const SizedBox(
                height: 48,
              ),
              buildMenuItem(
                  text: 'Profile',
                  icon: Icons.people,
                  onClicked: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profilepage()));
                  }),
              /*ListView.builder(
                itemCount: usersData.length,
                  itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profilepage(getprofiles: usersData[index],)));
                  },
                );
              }),*/
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                  text: "Favourites",
                  icon: Icons.favorite_border,
                  onClicked: () {}),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                  text: 'SignOut',
                  icon: Icons.logout,
                  onClicked: () async {
                    await _auth.signOut();
                  }),
              const Divider(
                color: Colors.white70,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      );

  Widget buildSearchBar() {
    const color = Colors.white;
    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintText: 'Search',
          hintStyle: const TextStyle(color: color),
          prefixIcon: const Icon(
            Icons.search,
            color: color,
          ),
          filled: true,
          fillColor: Colors.orangeAccent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: color.withOpacity(0.7)))),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    const color = Colors.white;
    const hovercolor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hovercolor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        //Navigator.push();
        break;
    }
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.endColor, this.startColor);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        const Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width, 0, size.width - radius, 0);
    path.lineTo(size.width - 1.5 * radius, 0);
    path.quadraticBezierTo(-radius, 2 * radius, 0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
