import 'package:authentification/dashboard.dart';
import 'package:authentification/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  // final Function toggle_View;
  // // // ignore: non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  // Login({required this.toggle_View});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool loading = false;
  String email = '';
  String password = '';
  String error = "";
  // String email = '', password = '';

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserManagement().handleAuth()));
      }
    });
  }

//   @override
//   void initState()
//   {
//     super.initState();
//     this.checkAuthentification();
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                            ),
                            validator: (val) => (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(val!))
                                ? "Please Enter a Valid Email"
                                : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          //SizedBox(height: 7.0,),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                            ),
                            validator: (val) {
                              if (val!.length < 8) {
                                return "Please Enter a Password 8 characters long";
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        // ignore: deprecated_member_use
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not Login with those credentials!';
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.green,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const Text(
                            "Proceed",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      error,
                      style: TextStyle(fontSize: 15.0, color: Colors.red[700]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // widget.toggle_View();
                          },
                          icon: Icon(Icons.person),
                          label: Text('Register',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        )
                        //Text("SignUp",style: TextStyle(fontSize: 18,
                        //fontWeight: FontWeight.w600),)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 100),
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/background.png"),
                              fit: BoxFit.fitHeight)),
                    )
                  ],
                ),
              ))),
    );
  }

// we will be creating a widget for text field
  Widget inputFile({label, obscureText = false, password, email}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          onChanged: (val) {},
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFBDBDBD)),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDBDBD)))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
