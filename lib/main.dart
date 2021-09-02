import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:pdf_viewer_example/api/pdf_api.dart';
import 'package:pdf_viewer_example/page/open.dart';
import 'package:pdf_viewer_example/page/pdf_viewer_page.dart';
import 'package:pdf_viewer_example/widget/button_widget.dart';
import 'package:pdf_viewer_example/widget/fahres.dart';

Future main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'PDF Viewer';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: Ouverture(),
  );
}

class MainPage extends StatefulWidget {
  int a ;
  MainPage(this.a);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController pageController ;


  void onAddButtonTapped(int index) {

    // use this to animate to the page
    pageController.animateToPage(index);

    // or this to jump to it without animating
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    pageController = PageController(initialPage: widget.a, keepPage: true);
   // onAddButtonTapped(5);
  }
  
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
    final text = '${indexPage + 1} of $pages';
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
      return  WillPopScope(
        onWillPop: () async {
          Scaffold.of(context).openDrawer();
           return true;
        },
        child: Scaffold(
            key: _scaffoldKey,
            endDrawer: Container(
                width: 210,
                child: Container(
                  color:  Colors.black.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            selectDestination(0);
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    AlertDialog(
                                      title: Center(child: Text('إنتقال إلى سورة',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,

                                              fontSize: 22)),),
                                      content: Column(
                                        children: [
                                          Container(
                                            color: Colors.grey[200],
                                            padding: EdgeInsets.all(2),
                                            margin: EdgeInsets.all(2),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  color: Colors.black,
                                                  height: 40,
                                                  width: 40,
                                                  child: Center(
                                                      child: Text("آياتها ",style: TextStyle(color: Colors.white),)),
                                                ),
                                                Spacer(),
                                                Center(child: Text(
                                                  "اسم السورة ",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold),)),
                                                SizedBox(width: 12,),
                                                Container(
                                                  color: Colors.black,
                                                  height: 40,
                                                  width: 40,
                                                  child: Center(
                                                      child: Text("رقم",style: TextStyle(color: Colors.white),)),
                                                ),


                                              ],
                                            ),
                                          ),
                                          Container(
                                            height:MediaQuery.of(context).size.height * 0.65,
                                            child: ListView.builder(
                                              itemCount: souar.length,
                                              itemBuilder: (context, i) {
                                                return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        print(souar[i]['r']);
                                                        pageController  = PageController(initialPage: 55, keepPage: true);
                                                        Navigator.of(context).pop();
                                                      });
                                                    },
                                                    child: Container(
                                                      color: Colors.grey[200],
                                                      padding: EdgeInsets.all(2),
                                                      margin: EdgeInsets.all(2),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Container(
                                                            color: Colors.black,
                                                            height: 40,
                                                            width: 40,
                                                            child: Center(
                                                                child: Text("${souar[i]['numberOfAyahs']}",style: TextStyle(color: Colors.white),)),
                                                          ),
                                                          Spacer(),
                                                          Center(child: Text(
                                                            "${souar[i]['name']}",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight
                                                                    .bold),)),
                                                          SizedBox(width: 12,),
                                                          Container(
                                                            color: Colors.black,
                                                            height: 40,
                                                            width: 40,
                                                            child: Center(
                                                                child: Text("${souar[i]['number']}",style: TextStyle(color: Colors.white),)),
                                                          ),


                                                        ],
                                                      ),
                                                    )
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                            );
                          },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide( //                   <--- left side
                                color: Colors.white,
                                width: 3.0,
                              ),
                              top: BorderSide( //                    <--- top side
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('إنتقال إلى سورة ',style: TextStyle(color: Colors.white,fontSize: 19),),
                                SizedBox(width: 16,),
                                Icon(Icons.label,color: Colors.white,size: 30,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                          onTap: () {
                            selectDestination(0);
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    AlertDialog(
                                      title: Center(child: Text('إنتقال إلى جزء',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22)),),
                                      content: Container(
                                        child: ListView.builder(
                                          itemCount: ajza.length,
                                          itemBuilder: (context, i) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {

                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: ListTile(
                                                title: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Center(child: Text(
                                                      "${ajza[i]['j']}",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold),)),
                                                    SizedBox(width: 12,),
                                                    Center(child: Text("جزء",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold))),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                            );
                          },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide( //                   <--- left side
                                color: Colors.white,
                                width: 3.0,
                              ),
                              top: BorderSide( //                    <--- top side
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('إنتقال إلى جزء',style: TextStyle(color: Colors.white,fontSize: 19),),
                                SizedBox(width: 16,),
                                Icon(Icons.label,color: Colors.white,size: 30,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () {
                          selectDestination(0);
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  AlertDialog(
                                    title: Center(child: Text('إنتقال إلى جزء',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),),
                                    content: Container(
                                      child: ListView.builder(
                                        itemCount: ajza.length,
                                        itemBuilder: (context, i) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {

                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: ListTile(
                                              title: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Center(child: Text(
                                                    "${ajza[i]['j']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold),)),
                                                  SizedBox(width: 12,),
                                                  Center(child: Text("جزء",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide( //                   <--- left side
                                color: Colors.white,
                                width: 3.0,
                              ),
                              top: BorderSide( //                    <--- top side
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(child: Text('إنتقال إلى حزب  ',style: TextStyle(color: Colors.white,fontSize: 19),)),
                                SizedBox(width: 16,),
                                Center(child: Icon(Icons.label,color: Colors.white,size: 30,)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () {
                          selectDestination(0);
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  AlertDialog(
                                    title: Center(child: Text('إنتقال إلى جزء',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),),
                                    content: Container(
                                      child: ListView.builder(
                                        itemCount: ajza.length,
                                        itemBuilder: (context, i) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {

                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: ListTile(
                                              title: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Center(child: Text(
                                                    "${ajza[i]['j']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold),)),
                                                  SizedBox(width: 12,),
                                                  Center(child: Text("جزء",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide( //                   <--- left side
                                color: Colors.white,
                                width: 3.0,
                              ),
                              top: BorderSide( //                    <--- top side
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(child: Text('تفسير ميسر'.trim(),style: TextStyle(color: Colors.white,fontSize: 19),)),
                                SizedBox(width: 1,),
                                Center(child: Icon(Icons.label,color: Colors.white,size: 30,)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: () {
                          selectDestination(0);
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  AlertDialog(
                                    title: Center(child: Text('إنتقال إلى جزء',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22)),),
                                    content: Container(
                                      child: ListView.builder(
                                        itemCount: ajza.length,
                                        itemBuilder: (context, i) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {

                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: ListTile(
                                              title: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Center(child: Text(
                                                    "${ajza[i]['j']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold),)),
                                                  SizedBox(width: 12,),
                                                  Center(child: Text("جزء",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide( //                   <--- left side
                                color: Colors.white,
                                width: 3.0,
                              ),
                              top: BorderSide( //                    <--- top side
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('أحكام التجويد',style: TextStyle(color: Colors.white,fontSize: 19),),
                                SizedBox(width: 16,),
                                Icon(Icons.label,color: Colors.white,size: 30,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],

                  ),
                )),
            body: PageView.builder(
              controller: pageController,
              reverse: true,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () =>_scaffoldKey.currentState.openEndDrawer(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/coran_kaloun-${i + 1}.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: null /* add child content here */,
                  ),
                );
              },
              itemCount: 199, // Can be null
            )

        /*    PdfView(
              documentLoader: Center(child: CircularProgressIndicator()),
              pageLoader: Center(child: CircularProgressIndicator()),
              controller: _pdfController,
              onDocumentLoaded: (document) {
                setState(() {
                  _allPagesCount = document.pagesCount;
                });
              },
              onPageChanged: (page) {
                setState(() {
                  _actualPageNumber = page;
                });
              },
            ),*/
          ),
      );
  }

  void openPDF(BuildContext context, File file)  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
    );
  }
}
