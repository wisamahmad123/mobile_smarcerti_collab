import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfFilePath;

  const PdfViewerPage({Key? key, required this.pdfFilePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: PDFView(
        filePath: pdfFilePath, // Menampilkan PDF berdasarkan path lokal
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageFling: true,
        onError: (error) => print("PDF Error: $error"),
      ),
    );
  }
}

