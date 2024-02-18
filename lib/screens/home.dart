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
                      calculate();
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

  void calculate() {
    heightController.text =
        heightController.text.replaceAll(RegExp(r'[^0-9.]'), '');
    weightController.text =
        weightController.text.replaceAll(RegExp(r'[^0-9.]'), '');
    //ft to meter conversion x 0.3048
    // inch to ft & to meter x 0.0254
    String inch = '0';
    if (heightController.text.contains('.')) {
      List<String> parts = heightController.text.split('.');
      if (parts.length == 2) {
        inch = parts[1];
        debugPrint(inch);
      }
    }
    double heightInMeters = double.parse(heightController.text) * 0.3048 +
        (double.parse(inch) * 0.0254);
    double weightInKg = double.parse(weightController.text);
    double bmi = (weightInKg / pow(heightInMeters, 2));
    result = bmi.toStringAsFixed(1);
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
