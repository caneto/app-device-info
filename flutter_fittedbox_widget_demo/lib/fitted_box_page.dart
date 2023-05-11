
import 'package:flutter/material.dart';

class FittedBoxPage extends StatefulWidget {
  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}

class _FittedBoxPageState extends State<FittedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo widget FittedBox de layout"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Entenda Com FittedBox",
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 200,
                      child:
                      Image.asset("assets/screen.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );

  }
}
