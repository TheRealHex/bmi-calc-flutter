import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String result = '';
TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('BMI Calculator'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: result.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textField(heightController, 'Height (ft)', '6.1'),
                  textField(weightController, 'Weight (kg)', '70'),
                  // textField(weightController, 'Age (years)', '23'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 80)),
                    onPressed: () {
                      calculateBmi();
                    },
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(height: 10),
                  // reset the form
                  IconButton(
                    onPressed: () {
                      heightController.clear();
                      weightController.clear();
                      result = '';
                    },
                    icon: const Icon(Icons.repeat),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // show result
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // reset result
                  IconButton(
                      onPressed: () {
                        setState(() {
                          result = '';
                        });
                      },
                      icon: const Icon(Icons.refresh))
                ],
              ),
      ),
    );
  }

  void calculateBmi() {
    if (heightController.text.isEmpty || weightController.text.isEmpty) return;

    // remove strings from input if user types
    heightController.text =
        heightController.text.replaceAll(RegExp(r'[^0-9.]'), '');
    weightController.text =
        weightController.text.replaceAll(RegExp(r'[^0-9.]'), '');

    // get value of inch to change into meters
    String inch = '0';
    if (heightController.text.contains('.')) {
      List<String> parts = heightController.text.split('.');
      if (parts.length == 2) {
        inch = parts[1];
      }
    }

    double heightInMeters = double.parse(heightController.text) * 0.3048 +
        (double.parse(inch) * 0.0254);
    double weightInKg = double.parse(weightController.text);
    double bmi = (weightInKg / pow(heightInMeters, 2));
    String bmiString = bmi.toStringAsFixed(1);

    switch (bmi) {
      case < 18.5:
        result = '($bmiString) Eat more! 🍽️';
        break;
      case >= 18.5 && <= 25:
        result = "($bmiString) Great job! 🪅";
        break;
      case > 25 && <= 30:
        result = '($bmiString) Almost there! 🏃';
        break;
      default:
        result = '($bmiString) Lose the weight! 🥦';
    }
    setState(() {});
  }

  SizedBox textField(
      TextEditingController controller, String label, String hint) {
    return SizedBox(
      width: 120,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(label),
            hintText: hint,
            alignLabelWithHint: true,
          ),
        ),
      ),
    );
  }
}
