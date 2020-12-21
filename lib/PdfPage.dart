


import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

import 'PdfModel.dart';

class PdfPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PdfPage> {
  String url = "http://www.pdf995.com/samples/pdf.pdf";
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() { 
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromURL(url);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Pdf")),
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc, 
      indicatorBackground: Colors.red,
       showIndicator: false,
       showPicker: false,
       ),
    );
  }
}