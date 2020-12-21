import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SecondScreen.dart';

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var emailId =preferences.getString('emailId');
  runApp(MaterialApp(home: emailId==null?MyApp():TabBarDemo(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/LoginImage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 60.0, 32.0, 4.0),
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/MyImage.jpeg'),
              ),
            ),
            ValidLogin(),
          ],
        ),
      )),
    );
  }
}

class ValidLogin extends StatefulWidget {
  @override
  ValidLoginState createState() {
    return ValidLoginState();
  }
}

class ValidLoginState extends State<ValidLogin> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StartApp();
        }
        return Text("Loding");
      },
    );
  }
}

class StartApp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  String emailId;
  String password;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Column(
        children: [
          Form(
              autovalidate: true,
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: new TextStyle(
                        // fontFamily: 'Raleway',
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 4.0),
                      child: TextFormField(
                          controller: emailController,
                          onChanged: (text) {
                            print("First text field: $text");
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
                              labelText: 'Email Id',
                              labelStyle: new TextStyle(
                                  color: Colors.white, fontSize: 16.0)),
                          validator: //EmailValidator(errorText: "not a valid email")
                              MultiValidator([
                            RequiredValidator(errorText: "Required Feild *"),
                            EmailValidator(errorText: "not a valid email")
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 4.0),
                      child: TextFormField(
                          controller: passwordController,
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
                              labelText: 'Password',
                              labelStyle: new TextStyle(
                                  color: Colors.white, fontSize: 16.0)),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required Feild *"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: FlatButton(
                        color: Colors.blue.withOpacity(0.6),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () async {
                          emailId = emailController.text;
                          password = passwordController.text;
                          if (emailId.length == 0 || password.length == 0) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Enter crendential')));
                            return;
                          }
                          DocumentSnapshot d = await FirebaseFirestore.instance
                              .collection("Student")
                              .doc(emailId)
                              .get();
                          if (d.data() == null ||
                              d.data()["password"] != password) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('invalid login')));
                          } else {
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            preferences.setString("emailId",emailController.text);
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('valid login')));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabBarDemo(),
                                    settings: RouteSettings()));
                          }
                        },
                        child: Text('Proceed Securely'),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
