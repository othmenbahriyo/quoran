import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:pdf_viewer_example/widget/drawer.dart';
import 'package:pdf_viewer_example/widget/fahres.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({
    Key key,
    @required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  int _selectedDestination = 0;
  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      drawer: Container(
          width: 270,
          child: Container(
            color: Colors.white,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  color: Colors.orange,
                  height: 159,
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                    leading: Icon(Icons.label),
                    title: Text('إنتقال إلى سورة '),
                    selected: _selectedDestination == 0,
                    onTap: () {
                      selectDestination(0);
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Center(child: Text('إنتقال إلى سورة',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),),
                            content: Container(
                              child: ListView.builder(
                                itemCount: souar.length,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.setPage(souar[i]['r']);
                                        Navigator.of(context).pop();

                                      });
                                    },
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Center(child: Text("${souar[i]['s']}",style: TextStyle(fontWeight: FontWeight.bold),)),
                                          SizedBox(width: 12,),
                                          Center(child: Text("${i + 1}")),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                      ).then((value) {


                      });


                    }
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('إنتقال إلى جزء  '),
                  selected: _selectedDestination == 1,
                    onTap: () {
                      selectDestination(1);
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Center(child: Text('إنتقال إلى جزء',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),),
                            content: Container(
                              child: ListView.builder(
                                itemCount: ajza.length,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        controller.setPage(souar[i]['r']);
                                        Navigator.of(context).pop();

                                      });
                                    },
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Center(child: Text("${ajza[i]['j']}",style: TextStyle(fontWeight: FontWeight.bold),)),
                                          SizedBox(width: 12,),
                                          Center(child: Text("جزء",style: TextStyle(fontWeight: FontWeight.bold))),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                      ).then((value) {


                      });


                    }
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('إنتقال إلى حزب'),
                  selected: _selectedDestination == 2,
                  onTap: () => selectDestination(2),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('تفسير ميسر '),
                  selected: _selectedDestination == 2,
                  onTap: () => selectDestination(2),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('أحكام التجويد '),
                  selected: _selectedDestination == 2,
                  onTap: () => selectDestination(2),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('الإعدادات'),
                  selected: _selectedDestination == 3,
                  onTap: () => selectDestination(3),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('معلومات عنا'),
                  selected: _selectedDestination == 3,
                  onTap: () => selectDestination(3),
                ),
              ],

            ),
          )),
      body: Container(
        margin: EdgeInsets.all(20),
        child: PDFView(
          filePath: widget.file.path,
           autoSpacing: true,
           swipeHorizontal: true,
           pageSnap: true,
           pageFling: true,
          fitPolicy:FitPolicy.BOTH ,
          onRender: (pages) => setState(() => this.pages = pages),
          onViewCreated: (controller) =>
              setState(() => this.controller = controller),
          onPageChanged: (indexPage, _) =>
              setState(() => this.indexPage = indexPage),
        ),
      ),
    );
  }
}
