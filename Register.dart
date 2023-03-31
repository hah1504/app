import 'package:authentification/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentification/database.dart';
import 'package:authentification/user.dart';
import 'package:country_picker/country_picker.dart';
import 'package:group_radio_button/group_radio_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  Color _color = Colors.red;
  String Firstname = '';
  String Lastname = '';
  String exhibitor = '';
  String buyer = '';
  String address = '';
  var contact = '';
  List<String> cities = [
    'Karachi',
    'Islamabad',
    'Lahore',
    'Peshawar',
    'Quetta',
    'Multan',
    'Rawalpindi',
    'Sialkot',
    'Hyderabad'
  ];
  String _selectedlocation = '';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Userprofiles>>.value(
      value: DatabaseService().profiles,
      initialData: [],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    //padding: EdgeInsets.only(bottom: 10),
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.blueGrey[700],
                          image: DecorationImage(
                              alignment: Alignment.topCenter,
                              //Image.asset('assets/images/mobile-login.jpg'),
                              image: AssetImage(
                                  'assets/images/registrationscreen.png'))),
                    ),
                  ),
                  //SizedBox(height: 10.0,),
                  Text(
                    'Just a few more information about you',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                      margin: EdgeInsets.all(15.0),
                      child: Divider(
                        color: Colors.blueGrey[100],
                        thickness: 2.0,
                      )),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    //height: MediaQuery.of(context).size.height - 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //SizedBox(height: 20.0,),
                        Row(children: [
                          SizedBox(
                            width: 160.0,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  label: Text('First name')),
                              validator: (val) => val!.isEmpty
                                  ? "Please enter your First name"
                                  : null,
                              onChanged: (val) {
                                setState(() => Firstname = val);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 160.0,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  label: Text('Last name')),
                              validator: (val) => val!.isEmpty
                                  ? "Please enter your Last name"
                                  : null,
                              onChanged: (val) {
                                setState(() => Lastname = val);
                              },
                            ),
                          ),
                        ]),
                        Row(children: [
                          Padding(padding: EdgeInsets.all(30.0)),
                          Text('EXHIBITOR'),
                          Radio(
                            groupValue: exhibitor,
                            onChanged: (val) {
                              setState(() => exhibitor == val);
                            },
                            value: 'EXHIBITOR',
                          ),
                          Padding(padding: EdgeInsets.all(30.0)),
                          Text('BUYER'),
                          Radio(
                            groupValue: buyer,
                            onChanged: (val) {
                              setState(() => buyer == val);
                            },
                            value: 'BUYER',
                          ),
                        ]),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.house_rounded),
                              label: Text('Address')),
                          validator: (val) =>
                              val!.isEmpty ? "Please enter your Address" : null,
                          onChanged: (val) {
                            setState(() => address = val);
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.phone_android_rounded),
                              label: Text('Contact')),
                          validator: (val) => val!.isEmpty
                              ? "Please enter your contact number"
                              : null,
                          onChanged: (val) {
                            setState(() => contact = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 15.0,
                        ),
                        Row(children: [
                          SizedBox(
                            height: 60.0,
                            width: 155.0,
                            child: DropdownButton(
                              hint: _selectedlocation == null
                                  ? Text('Select City')
                                  : Text(
                                      _selectedlocation,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                              isExpanded: true,
                              iconSize: 30.0,
                              style: TextStyle(color: Colors.blue),
                              items: cities.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    _selectedlocation == val;
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                              height: 75.0,
                              width: 165.0,
                              child: Container(
                                height: 35.0,
                                padding: EdgeInsets.all(15.0),
                                child: ElevatedButton.icon(
                                  style:
                                      ElevatedButton.styleFrom(primary: _color),
                                  label: Text(
                                    'Create',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardPage()));
                                  },
                                ),
                              ))
                        ])
                      ],
                    ),
                  ),
                  //testing code
                  Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()));
                        }

                        // onPressed: () async {
                        //   if (_formkey.currentState!.validate()) {
                        //     setState(() => loading = true);
                        //     dynamic result =
                        //         await _auth.createUserWithEmailAndPassword(
                        //             email: email, password: password);
                        //     if (result == null) {
                        //       setState(() {
                        //         error =
                        //             'Could not register with those credentials!';
                        //             loading = false;

                        //       });
                        //     } else {
                        //       // ignore: use_build_context_synchronously
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   RegisterScreen()));
                        //     }
                        //   }
                        // },
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
