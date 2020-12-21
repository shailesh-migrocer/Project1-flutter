import 'package:Project1/UserDataModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class Tutor_details extends StatelessWidget {
  User data;
  Tutor_details(var data) {
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    String _email,_firstname,_lastname;
    _email=data.emailID;
    _firstname=data.firstName;
    _lastname=data.lastName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutor Details"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height:15),
           Center(
             child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(data.avatarUrl),
                ),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "Tutor Details",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(             
                "First Name : , ${data.emailID}",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(             
                "Last Name:  $_lastname",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(             
                "Email Id:  $_email",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
        ],
      ),
    );
  }
}
