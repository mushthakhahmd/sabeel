import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewPage extends StatefulWidget {
  final String pageHeader, path;
  const PdfViewPage({Key? key, required this.pageHeader, required this.path})
      : super(key: key);

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  bool isLoading = true;
  // late PDFDocument document;
  String pathPDF = "";

  int totalPage = 0;
  int curentPage = 0;
  @override
  void initState() {
    // loadDocument();

    fromAsset(widget.path, 'demo.pdf').then((f) {
      setState(() {
        pathPDF = f.path;

        isLoading = false;
      });
    });
    super.initState();
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  // loadDocument() async {
  //   document =
  //       await PDFDocument.fromAsset(widget.path, clearPreviewCache: false);

  //   setState(() => isLoading = false);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon:
                    const Icon(Icons.keyboard_arrow_left, color: Colors.black)),
            title: Text(
              widget.pageHeader,
              style: const TextStyle(color: Colors.black),
            )),
        body: Center(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : PDFView(
                  filePath: pathPDF,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageFling: true,
                  onRender: (_pages) {
                    if (_pages == null) return;
                    setState(() {
                      totalPage = _pages;
                      // isReady = true;
                    });
                  },
                  onError: (error) {
                    print(error.toString());
                  },
                  onPageError: (page, error) {
                    print('$page: ${error.toString()}');
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                  onPageChanged: (int? page, int? total) {
                    print('page change: $page/$total');

                    if (page == null) return;
                    setState(() {
                      curentPage = page + 1;

                      // isReady = true;
                    });
                  },
                ),
        ),
        bottomNavigationBar: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 5),
                child: Text(
                  "Page $totalPage/$curentPage",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
