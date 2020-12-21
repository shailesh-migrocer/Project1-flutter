import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:awesome_package/awesome_package.dart';

class Imageclass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/project1-65920.appspot.com/o/SchoolImage.jfif?alt=media&token=9d319a1b-0997-4288-9795-4b1f50216ef9',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "The ABC School was established in 2000. It is approved by the All India Council for Technical Education and accredited by the National Board of Accreditation, India. ABC School was affiliated with XYZ School, Hyderabad.",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Text(""),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Address:",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "M), Rangareddy (D, Vastunagar, Mangalpalli (V), Ibrahimpatnam, Pocharam, Telangana",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Using the Raleway font from the awesome_package',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    package: 'awesome_package',
                  ),
                )),
            // Row(
            //   children: <Widget>[

            //   ],
            // )
          ]),
        ),
      ),
    );
  }
}
