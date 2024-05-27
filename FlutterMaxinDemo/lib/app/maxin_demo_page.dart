import 'package:flutter/material.dart';

import 'maxin.dart';

class MaxinDemoPage extends StatefulWidget {
  const MaxinDemoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MaxinDemoPageState createState() => _MaxinDemoPageState();
}

class _MaxinDemoPageState extends State<MaxinDemoPage> with TimerMixin {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    disposeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text(
                'Hello',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  side: const BorderSide(width: 2, color: Colors.white),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                ),
                child: const Text(
                  "Finsh",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
