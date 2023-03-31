import 'package:authentification/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentification/Register.dart';
import 'package:authentification/spinkitloader.dart';
import 'package:flutter/services.dart';

class signUp extends StatefulWidget {
  final Function toggle_View;
  signUp({required this.toggle_View});
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String error = "";
  //TextEditingController password =  TextEditingController();
  //TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
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
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height - 50,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an account, It's free ",
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                label: Text("Username")),
                            validator: (val) =>
                                val!.isEmpty ? "Please Enter a UserName" : null,
                            onChanged: (val) {
                              setState(() => username = val);
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                icon: Icon(Icons.alternate_email),
                                label: Text("Email")),
                            validator: (val) => (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(val!))
                                ? "Please Enter a Valid Email"
                                : null,
                            //validator: (val) => val!.isEmpty ? 'Please enter an Email address' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          TextFormField(
                            //keyboardType: TextInputType.text,
                            //controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.password),
                                label: Text("Password")),
                            //validator: (val) => val!.length < 8 ? "Please Enter a Password 8 characters long" : val!.isEmpty? password.clear(): null,
                            validator: (val) {
                              if (val!.length < 8) {
                                return "Please Enter a Password 8 characters long";
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          TextFormField(
                            //keyboardType: TextInputType.text,
                            //controller: confirmPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.password_rounded),
                                label: Text("Confirm Password")),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Re-Enter Password";
                              }
                              if (password != confirmPassword) {
                                return 'Passwords not matched!';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() => confirmPassword = val);
                            },
                          ),

                          /*inputFile(label: "Username"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obscureText: true),
                  inputFile(label: "Confirm Password ", obscureText: true)*/
                        ],
                      ),
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
                          // onPressed: () async {
                          //   if (_formkey.currentState!.validate()) {
                          //     dynamic result =
                          //         await _auth.createUserWithEmailAndPassword(
                          //             email: email, password: password);
                          //     if (result == null) {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => Login()));
                          //     } else {
                          //       // ignore: use_build_context_synchronously
                          //       error =
                          //           'Could not register with those credentials!';
                          //     }
                          //   } else {
                          //     error = 'error';
                          //   }
                          // },

                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() => loading = false);
                              dynamic result =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not register with those credentials!';
                                  loading = false;
                                });
                              } else {
                                setState(() => loading = true);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              }
                            }
                          },

                          color: const Color(0xff0095FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account ? ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              widget.toggle_View();
                            },
                            icon: Icon(Icons.login_outlined),
                            label: Text("Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        error,
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.red[700]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

Widget inputFile({label, obscureText = false}) {
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
