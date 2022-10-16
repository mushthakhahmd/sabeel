import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';


class PdfViewPage extends StatefulWidget {
  final String pageHeader, path;
  const PdfViewPage({Key? key, required this.pageHeader, required this.path})
      : super(key: key);

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  bool isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    loadDocument();
    super.initState();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset(widget.path);

    setState(() => isLoading = false);
  }

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
                icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black)),
            title: Text(
              widget.pageHeader,
              style: const TextStyle(color: Colors.black),
            )),
        body: Center(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : PDFViewer(
                  document: document,
                  lazyLoad: false,
                  zoomSteps: 1,
                  showPicker: true,
                  showNavigation: true,
                scrollDirection: Axis.vertical,
                ),
        ),
      ),
    );
  }
}


