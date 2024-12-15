import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_smarcerti/services/pdf_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobile_smarcerti/widgets/app_bar_custom.dart';

class PdfViewerPage extends StatefulWidget {
  final String? pdfFilePath;

  const PdfViewerPage({Key? key, required this.pdfFilePath}) : super(key: key);

  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();

  int? pages = 0;
  int? currentPage = 0;
  bool pdfReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBarCustom(title: 'PDF Viewer'),
      body: Stack(children: <Widget>[
        PDFView(
          filePath:
              widget.pdfFilePath, // Menampilkan PDF berdasarkan path lokal
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          defaultPage: currentPage!,
          fitPolicy: FitPolicy.BOTH,
          preventLinkNavigation: false,
          backgroundColor: Colors.grey[300],
          onRender: (_pages) {
            setState(() {
              pages = _pages;
              pdfReady = true;
            });
          },
          onError: (error) {
            setState(() {
              errorMessage = error.toString();
            });
            print(error.toString());
          },
          onPageError: (page, error) {
            setState(() {
              errorMessage = '$page: ${error.toString()}';
            });
            print('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController pdfViewController) {
            _pdfViewController.complete(pdfViewController);
          },
          onLinkHandler: (String? uri) {
            print('goto uri: $uri');
          },
          onPageChanged: (int? page, int? total) {
            print('page change: $page/$total');
            setState(() {
              currentPage = page;
            });
          },
        ),
      ]),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _pdfViewController.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go to ${pages! ~/ 2}"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
