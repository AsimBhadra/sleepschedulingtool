import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleepscheduling/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sleepscheduling/components/my_flutter_app_icons.dart';
import 'package:sleepscheduling/screens/sleep_details.dart';
import 'package:sleepscheduling/screens/exercise_details.dart';
import 'package:sleepscheduling/screens/food_details.dart';
import 'package:sleepscheduling/screens/temperature_details.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  void getWriteData() {
    Firebase.initializeApp();
    final User user = auth.currentUser;
    final uid = user.uid;
    final email = user.email;
    FirebaseDatabase.instance.reference().child('users').child(uid).set({
      'email': email,
    });
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    getWriteData();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: kTitleText,
        ),
        backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text('Welcome, Asim',style: kTimeText,),
              SizedBox(height: 25.0),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SleepDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1a1728),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularPercentIndicator(
                          radius: width/2.25,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 1200,
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          progressColor: kLightBlueColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: 0.88,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesome.bed,
                                size: 30.0,
                                color: kLightBlueColor,
                              ),
                              Text(
                                '8H',
                                style: kTimeText,
                              ), //Requires replacing by sleep data
                              Text(
                                '12m',
                                style: kTimeText,
                              ), //Requires replacing by sleep data
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 17.5,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_upward,
                                color: Colors.green,
                              size: 45.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('30m',style: kTimeText,),
                                  Text('From Yesterday', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Icon(Icons.warning,
                                color: Colors.orange,
                                size: 40.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('50m less',style: kTimeText,),
                                  Text('Than Average', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExerciseDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1a1728),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_upward,
                                color: Colors.green,
                                size: 45.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('30m',style: kTimeText,),
                                  Text('From Yesterday', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Icon(Icons.done_all,
                                color: Colors.green,
                                size: 40.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('5m more',style: kTimeText,),
                                  Text('Than Average', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 12.5,),
                      CircularPercentIndicator(
                        radius: width/2.25,
                        lineWidth: 17.5,
                        animation: true,
                        animationDuration: 1200,
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        progressColor: Colors.green,
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: 0.70,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MyFlutterApp.stretching_exercises,
                              size: 30.0,
                              color: Colors.green,
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              '45 m',
                              style: kTempText,
                            ),
                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1a1728),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularPercentIndicator(
                          radius: width/2.25,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 1200,
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          progressColor: Colors.deepOrangeAccent,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: 0.88,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MyFlutterApp.food,
                                size: 30.0,
                                color: Colors.deepOrangeAccent,
                              ),
                              Text(
                                '2500 kCal',
                                style: kTimeText,
                              ), //Requires replacing by sleep data
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 17.5,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_upward,
                                color: Colors.green,
                                size: 45.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('150 kCal',style: kTimeText,),
                                  Text('From Yesterday', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Icon(Icons.warning,
                                color: Colors.orange,
                                size: 40.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('50KCal less',style: kTimeText,),
                                  Text('Than Average', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TemperatureDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1a1728),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_downward,
                                color: Colors.orange,
                                size: 45.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('2°F',style: kTimeText,),
                                  Text('From Yesterday', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: [
                              Icon(Icons.warning,
                                color: Colors.orange,
                                size: 40.0,
                              ),
                              SizedBox(width: 2.0,),
                              Column(
                                children: [
                                  Text('1°F less',style: kTimeText,),
                                  Text('Than Average', style: kInsightsText,),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 12.5,),
                      CircularPercentIndicator(
                        radius: width/2.25,
                        lineWidth: 17.5,
                        animation: true,
                        animationDuration: 1200,
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        progressColor: Color(0xFFd3ac5f),
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: 0.70,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesome.thermometer,
                              size: 30.0,
                              color: Color(0xFFd3ac5f),
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              '96°F',
                              style: kTempText,
                            ),
                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Icon(
//       Icons.arrow_upward,
//       color: kLightBlueColor,
//       size: 35.0,
//     ),
//     Text(
//       '40m from yesterday',
//       style: kAdvice1,
//     ),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Icon(
//       MaterialIcons.warning,
//       color: Colors.deepOrange,
//       size: 35.0,
//     ),
//     Text(
//       '12m less than recommended',
//       style: kAdvice2,
//     ),
//   ],
// ),
