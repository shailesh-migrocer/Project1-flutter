import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ContactPage.dart';
import 'main.dart';
import 'FeedbackPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerPage extends StatefulWidget {
  @override
  DrawePageState createState() => DrawePageState();
}
class DrawePageState extends State<DrawerPage> {
  static FirebaseAuth auth = FirebaseAuth.instance;
  String emailId = "";

  Future getEmail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     setState(() {
       emailId = preferences.getString('emailId');
     });
  }

  Future logOut(BuildContext context)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('emailId');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp(),),);
     }


  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            // accountName: null,
            // accountEmail: null,
            // currentAccountPicture: new CircleAvatar(
            //   backgroundColor: Colors.redAccent,
            // ),
            child: Text("Menu"),
          ),
          new ListTile(
            title: Text('Feed back'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
            },
          ),
          new ListTile(
            title: Text('Contact us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => ContactPage()),
              );
            },
          ),
          new ListTile(
            title: Text('Sign out'),
            onTap: () {
              // Future(() async {
              //   if (auth != null) {
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) => MyApp()));
              //   }
              // });
              logOut(context);
            },
          ),
        ],
      ),
    );
  }
}
