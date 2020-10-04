import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sleepscheduling/screens/homePage.dart';
import 'package:sleepscheduling/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(MaterialApp(home: email == null ? LoginScreen() :HomePage()));
}
