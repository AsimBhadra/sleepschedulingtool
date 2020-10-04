import 'package:flutter/material.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:sleepscheduling/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleepscheduling/screens/homePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: _screenSize.height,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 150.0,),
                  Image.asset('assets/images/logo.png'),
                  Container(
                    height: 45.0,
                    width: 300.0,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        _email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: 'Email address'),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    height: 45.0,
                    width: 300.0,
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      onChanged: (value){
                        _password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
                    ),
                  ),
                  RoundedButton(
                    title: 'Log In',
                    colour: kBlueColor,
                    onPressed: () async {
                      try{

                        User user =
                            (await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            )).user;
                        if (user != null){
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('email', _email);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
                        }
                      }
                      catch(e){
                        print(e);
                        _email = "";
                        _password = "";
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
