class PdfModel{
  String pdfUrl;
  String pdfName;
  PdfModel(var data){
    this.pdfUrl = data['url'];
    this.pdfName = data['name'];
  }
}