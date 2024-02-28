import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>Navigator.pop(context),
          child: const Text("Back"),
        ),
      ),
    );
  }
}
