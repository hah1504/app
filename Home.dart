import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exhibitors"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Exhibtors $index"),
                        ),
                        color: Colors.green[700],
                      )),
            ),
            Flexible(
                child: ListView.builder(
                    itemCount: 15,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                          title: Text("List $index"),
                        )))
          ]),
        ),
      ),

      // body: Column(
      //   children: <Widget>[
      //     Text('B2B Meetings'),
      //     Text('TEXPO'),
      //     Text('JAN'),
      //   ],
      // ),
    );
  }
}
