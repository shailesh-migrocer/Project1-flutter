import 'package:Project1/Tutor_details.dart';
import 'package:Project1/UserDataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Tutor extends StatefulWidget {
  Tutor({Key key}) : super(key: key);

  TutorState createState() => TutorState();
}

class TutorState extends State<Tutor> {
  Map data;
  List userData;

  Future getData() async {
    http.Response response =
    
        await http.get("https://reqres.in/api/users?page=2");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print("on tap");
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Tutor_details(User(userData[index]))),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(userData[index]["avatar"]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
