import 'package:bmi_calculator/widgets/label.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: const Center(
            child: Label(
          text: 'Result',
        )),
      ),
    );
  }
}
