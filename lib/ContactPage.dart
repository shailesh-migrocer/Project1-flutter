import 'package:flutter/material.dart';
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Information")),
      body: Column(
        children: <Widget>[
          SizedBox(height:15),
           Center(
             child: CircleAvatar(
                  radius: 80.0,
                backgroundImage: AssetImage('images/MyImage.jpeg'),
                ),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "XYZ",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(             
                "Name :  shailesh",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(             
                "Email Id:  abc@gmail.com",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(             
                "Phone Number:  7894561230",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
        ],
      )
    );
  }
}