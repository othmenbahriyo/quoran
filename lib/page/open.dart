import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pdf_viewer_example/main.dart';
import 'package:pdf_viewer_example/page/firstScreen.dart';
class Ouverture extends StatefulWidget {
  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Ouverture> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }
  String role;

  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {return First();}));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      startTime();
    });
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return RepaintBoundary(
        child: Material(
          child: Container(decoration: new BoxDecoration(color: Colors.white),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("المصحف المعلم",style: TextStyle(fontSize: 45,fontWeight:FontWeight.bold),)),
                SizedBox(height: 15,),
                Center(child: Lottie.asset("assets/open.json",)),
                SizedBox(height: 15,),
                Center(child: Text("برواية الإمام قالون عن نافع المدني"))
              ],
            ),),)
    );


  }
}
