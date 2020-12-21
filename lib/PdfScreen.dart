import 'package:flutter/material.dart';
import 'PdfPage.dart';
class PdfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                print("on tap");
                // Scaffold.of(context)
                //     .showSnackBar(SnackBar(content: Text('Showing PDF')));
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PdfPage()),
              );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "Veiw PDF",
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
