import 'package:flutter/material.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:sleepscheduling/components/my_flutter_app_icons.dart';
import 'package:sleepscheduling/screens/flight_details.dart';
import 'package:sleepscheduling/screens/launch_land_time.dart';
import 'package:sleepscheduling/screens/docking_time.dart';
import 'package:sleepscheduling/screens/iss_fit_data.dart';
import 'package:sleepscheduling/screens/settings.dart';
import 'package:sleepscheduling/screens/about.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('More',style: kTitleText,),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FlightDetails()),
                );
              },
              child: Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flight, size: 50.0, color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Text('FLIGHT DETAILS', style: kTitleTextBold),
                        SizedBox(height: 10.0,),
                        Text('Get all fight details.', style: kTitleText,),],
                    ),
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LaunchLandTime()),
                );
              },
              child: Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        MyFlutterApp.rocket,
                        size: 50.0,
                        color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Text('LAUNCH / LAND', style: kTitleTextBold),
                        Text('TIME CONSIDERATION', style: kTitleTextBold),
                    ]
              ),
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DockingTime()),
                );
              },
              child: Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      MyFlutterApp.space_shuttle,
                      size: 50.0,
                      color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Column(
                        children: [
                          Text('DOCKING / UNDOCKING', style: kTitleTextBold),
                          Text('TIME CONSIDERATION', style: kTitleTextBold),
                        ]
                    ),
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => IssFitData()),
                );
              },
              child: Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.watch,
                      size: 50.0,
                      color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Column(
                        children: [
                          Text('GET ISS FIT DATA', style: kTitleTextBold),
                        ]
                    ),
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              child: Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 50.0,
                      color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Column(
                        children: [
                          Text('SETTINGS', style: kTitleTextBold),
                        ]
                    ),
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
              child: Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      size: 50.0,
                      color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Column(
                        children: [
                          Text('ABOUT APP', style: kTitleTextBold),
                        ]
                    ),
                  ],
                ) ,
              ),
            ),
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                width: width-50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1728),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 50.0,
                      color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Column(
                        children: [
                          Text('LOG OUT', style: kTitleTextBold),
                        ]
                    ),
                  ],
                ) ,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
