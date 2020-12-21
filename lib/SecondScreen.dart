import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Imageclass.dart';
import 'PdfScreen.dart';
import 'tutor.dart';
import 'DrawerPage.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          headline2: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
          
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home),text: "Home",),
                Tab(icon: Icon(Icons.person),text: "Tutors",),
                Tab(icon: Icon(Icons.star),text: "Star",),
              ],
            ),
            title: Text('ABC School'),
          ),
          body: TabBarView(
            children: [
              Imageclass(),
              Tutor(),
              PdfScreen(),
            ],
          ),
          drawer: DrawerPage(),
        ),
      ),
    );
  }
}
