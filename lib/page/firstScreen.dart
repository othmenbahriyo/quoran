import 'package:flutter/material.dart';
import 'package:pdf_viewer_example/main.dart';
import 'package:pdf_viewer_example/widget/fahres.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: ListView(
          children: [
            Center(child: Text("فهرس السور ",style: TextStyle(fontSize: 45,fontWeight:FontWeight.bold),)),
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
              height:MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemCount: souar.length,
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage(souar[i]['r'])),
                          );
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
      ),
    );
  }
}
