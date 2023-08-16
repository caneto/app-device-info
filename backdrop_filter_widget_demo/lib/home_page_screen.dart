import 'package:flutter/material.dart';
import 'package:flutter_backdrop_filter_widget/image_blur.dart';
import 'package:flutter_backdrop_filter_widget/image_text_blur.dart';
import 'package:flutter_backdrop_filter_widget/text_blur.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text("Flutter BackdropFilter Widget Demo"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[200],
                side: const BorderSide(width: 3, color: Colors.cyan),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(13),
              ),
              child: Text(
                'Image Blur',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ImageBlur()));
              },
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[100],
                side: const BorderSide(width: 3, color: Colors.cyan),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(13),
              ),
              child: Text(
                'Text Blur',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TextBlur()));
              },
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[100],
                side: const BorderSide(width: 3, color: Colors.cyan),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(13),
              ),
              child: Text(
                'Image & Text Blur',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ImageTextBlur()));
              },
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      )), //center
    );
  }
}
