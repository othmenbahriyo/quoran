import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer_example/widget/fahres.dart';
class EndDrawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<EndDrawer> {
  int _selectedDestination = 0;
  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
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
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Center(child: Text('إنتقال إلى سورة',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),),
                      content: Container(
                        child: ListView.builder(
                          itemCount: souar.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(child: Text("${souar[i]}",style: TextStyle(fontWeight: FontWeight.bold),)),
                                  SizedBox(width: 12,),
                                  Center(child: Text("${i + 1}")),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                );
              }
            ),
            ListTile(
              leading: Icon(Icons.label),
              title: Text('إنتقال إلى جزء  '),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
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
    );
  }
}
