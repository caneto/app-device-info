
import 'package:flutter/material.dart';

class BoxPage extends StatefulWidget {
  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
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
            Card(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Entenda Sem FittedBox",
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
          ],
        ),
    );

  }
}
