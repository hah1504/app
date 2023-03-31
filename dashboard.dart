import 'package:authentification/Categories.dart';
import 'package:authentification/Documents.dart';
import 'package:authentification/Home.dart';
import 'package:authentification/Meeting.dart';
import 'package:authentification/Profile.dart';
import 'package:authentification/Search.dart';
import 'package:authentification/Settings.dart';
import 'package:authentification/profilepage.dart';
import 'package:flutter/material.dart';
import 'allusers.dart';
import 'usermanagement.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  int _selected = 0;

  var pages = [
    Home(),
    Categories(),
    Search(),
    Profile(),
  ];

  void changeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Center(
          // ignore: prefer_const_literals_to_create_immutables
          child: ListView(children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Haseeb'),
              accountEmail: Text('haseeb@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://texpo.tdap.gov.pk/wp-content/uploads/2023/03/Texpo-KV-web-banner.jpg'),
                //fit: BoxFit.cover,
              ),
            ),

            // ignore: unnecessary_new
            ListTile(
              selected: _selected == 0,
              leading: Icon(
                Icons.photo_camera_front,
                size: 28,
              ),
              title: Text('All Users Page'),
              onTap: () {
                changeSelected(0);
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AllUsersPage())));
              },
            ),

            ListTile(
              selected: _selected == 1,
              leading: Icon(
                Icons.face_2,
                size: 28,
              ),
              title: Text('Profile'),
              onTap: () {
                changeSelected(1);
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AllUsersPage())));
              },
            ),

            ListTile(
              selected: _selected == 2,
              leading: Icon(
                Icons.meeting_room,
                size: 28,
              ),
              title: Text('Meetings Schedule'),
              onTap: () {
                changeSelected(2);
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Meeting())));
              },
            ),

            ListTile(
              selected: _selected == 3,
              leading: Icon(
                Icons.upload_file,
                size: 28,
              ),
              title: Text('Documents Uploader'),
              onTap: () {
                changeSelected(3);
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Documents())));
              },
            ),

            ListTile(
              selected: _selected == 4,
              leading: Icon(
                Icons.map,
                size: 28,
              ),
              title: Text('Expo Center Floor Map'),
              onTap: () {
                changeSelected(4);
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Documents())));
              },
            ),

            Divider(
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),

            ListTile(
              selected: _selected == 5,
              leading: Icon(
                Icons.settings,
                size: 28,
              ),
              title: Text('Settings'),
              onTap: () {
                changeSelected(5);
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Settings())));
              },
            ),

            ListTile(
              selected: _selected == 6,
              leading: Icon(
                Icons.info,
                size: 28,
              ),
              title: Text('About'),
              onTap: () {
                changeSelected(6);
                UserManagement().authorizeAccess(context);
              },
            ),

            ListTile(
                selected: _selected == 7,
                leading: Icon(
                  Icons.logout,
                  size: 28,
                ),
                title: Text('Logout'),
                onTap: () {
                  changeSelected(7);
                  // UserManagement().authorizeAccess(context).hashCode;
                  // UserManagement().handleAuth();
                  UserManagement().signOut();
                }),
          ]),
        ),
      ),
      // body: Center(
      //   child: Text('Home Page'),
      // ),
      body: Container(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemSelected,
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
