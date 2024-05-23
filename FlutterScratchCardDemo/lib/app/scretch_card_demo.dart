import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScretchCardDemo extends StatefulWidget {
  const ScretchCardDemo({super.key});

  @override
  State<ScretchCardDemo> createState() => _ScretchCardDemoState();
}

class _ScretchCardDemoState extends State<ScretchCardDemo> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Flutter Scratch Card Demo"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: Scratcher(
          brushSize: 50,
          threshold: 75,
          color: Colors.blue,
          image: Image.asset(
            "assets/scratch.png",
            fit: BoxFit.fill,
          ),
          // ignore: avoid_print
          onChange: (value) => print("Scratch progress: $value%"),
          onThreshold: () => _controller.play(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/flutter.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.height * 0.25,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Column(
                  children: [
                    ConfettiWidget(
                      blastDirectionality: BlastDirectionality.explosive,
                      confettiController: _controller,
                      particleDrag: 0.05,
                      emissionFrequency: 0.05,
                      numberOfParticles: 100,
                      gravity: 0.05,
                      shouldLoop: false,
                      colors: const [
                        Colors.green,
                        Colors.red,
                        Colors.yellow,
                        Colors.blue,
                        Colors.purple
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
