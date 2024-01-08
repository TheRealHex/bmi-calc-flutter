import 'package:bmi_calculator/widgets/input.dart';
import 'package:bmi_calculator/widgets/label.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('BMI Calculator'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Spacer(),
                Label(text: 'Height'),
                TextInputField(hint: 'ft'),
                Spacer(),
              ],
            ),
            const Row(
              children: [
                Spacer(),
                Label(text: 'Weight'),
                TextInputField(hint: 'kg'),
                Spacer(),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: const Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
