import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About App'),backgroundColor: Colors.black,),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          Text('This app is developed during two day hackathon NASA Space Apps Challenge 2020.',style: kTitleText,textAlign: TextAlign.center,),
          SizedBox(height: 15.0,),
          Text('Team Name: Bugbusters',style: kTitleText,),
          Text('Team members: ',style: kTitleText,),
          Text('Ashim Bhadra ',style: kTitleText,),
          Text('Ankit Kayastha ',style: kTitleText,),
          Text('Gaurav Poudel ',style: kTitleText,),
          Text('Safal Ghimire ',style: kTitleText,),
          Text('Sanjita Pokhrel',style: kTitleText,),
          SizedBox(height: 20.0,),
          Text('Check this open source app on Github', style:kTitleText,),
          Text('github.com/AsimBhadra/sleepschedulingtool', style:kTitleText,),
          Text('Contact Us: ashim.bhadra14@gmail.com', style:kTitleText,),

        ],
      ),
    );
  }
}
