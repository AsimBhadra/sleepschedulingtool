import 'package:flutter/material.dart';
import 'package:sleepscheduling/screens/dashboard.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:sleepscheduling/screens/more_page.dart';
import 'package:sleepscheduling/screens/profile_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        items:[
          BottomNavyBarItem(
            icon: Icon(Icons.graphic_eq, size: 30.0,),
            title: Text('Dashboard',style: TextStyle(fontSize: 15.0),),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person, size: 30.0,),
            title: Text('My Profile',style: TextStyle(fontSize: 15.0),),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.menu,size: 30.0,),
            title: Text('More',style: TextStyle(fontSize: 15.0),),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
        ],
        selectedIndex: _selectedIndex,
        onItemSelected: _onTappedBar,
        backgroundColor: Colors.black,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Dashboard(),
          ProfileScreen(),
          MorePage(),
        ],
        onPageChanged:(page){
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
    );
  }
  void _onTappedBar(int value){
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
