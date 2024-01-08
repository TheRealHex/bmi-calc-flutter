import 'package:bmi_calculator/widgets/input.dart';
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
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextInputField(hint: 'ft'),
            const TextInputField(hint: 'kg'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Test'),
            ),
          ],
        ),
      ),
    );
  }
}
