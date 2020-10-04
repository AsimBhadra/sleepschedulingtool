import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sleepscheduling/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Profile',style: kTitleText,),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0,),
              RawMaterialButton(
                onPressed: null,
                elevation: 5.0,
                fillColor: Colors.white,
                child: Icon(
                  FontAwesome.user,
                  color: Colors.black,
                  size: 100.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: width-50.0,
                decoration: BoxDecoration(
                    color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('PERSONAL INFO', style: kTitleTextBold),
                    SizedBox(height: 10.0,),
                    Text('Name: Asim Bhadra', style: kTitleText,),
                    Text('E-mail: ashim.bhadra14@gmail.com', style: kTitleText,),
                    Text('Date of Birth: 12 August 2001', style: kTitleText,),
                  ],
                ) ,
              ),
              SizedBox(height: 20.0,),
              Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('PROFESSIONAL DETAILS', style: kTitleTextBold),
                    SizedBox(height: 10.0,),
                    Text('Organization: ABCD Organization', style: kTitleText,),
                    Text('Position: ACBD', style: kTitleText,),
                    Text('Address: XYZ', style: kTitleText,),
                  ],
                ) ,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
