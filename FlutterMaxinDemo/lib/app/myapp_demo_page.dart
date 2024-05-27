import 'package:demo_dismissible/app/maxin_demo_page.dart';
import 'package:flutter/material.dart';

class MyAppDemoPage extends StatelessWidget {
  const MyAppDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            side: const BorderSide(width: 3, color: Colors.white),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(20),
          ),
          child: const Text(
            "Navigate",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MaxinDemoPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
