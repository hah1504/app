import 'package:authentification/Register.dart';
import 'package:authentification/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:authentification/Login.dart';
import 'package:authentification/signup.dart';

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              height: 400,
              child: Image(
                image: AssetImage(
                    'assets/images/New-Texpo-Final-logo-webdark-2048x1110.png'),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                  text: 'WELCOME TO',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'TEXPO',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    )
                  ]),
            ),
            SizedBox(height: 10.0),
            Text(
              'Trade Development Authority Of Pakistan',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  //style: ElevatedButton.styleFrom( padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                //toggle_View: toggleView,
                                )));
                    ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 30, right: 30));
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.orange))),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signUp(
                                  toggle_View: toggleView,
                                )));
                    ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 30, right: 30));
                  },
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.orange))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
