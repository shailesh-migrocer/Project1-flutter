import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feed back Page")),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35),
            Center(
                child: Text(
              "Feed back",
              style: Theme.of(context).textTheme.headline1,
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 4.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                onChanged: (text) {
                  print("Second text field: $text");
                },
                decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.6),
                    filled: true,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      
                    ),
                    labelText: 'Enter your opion here',
                    labelStyle:
                        new TextStyle(color: Colors.white, fontSize: 16.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FlatButton(
                color: Colors.blue.withOpacity(0.6),
                textColor: Colors.white,
                splashColor: Colors.blueAccent,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Text("Thank you!,for giving the feed back"),
                          settings: RouteSettings()));
                  // }
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
