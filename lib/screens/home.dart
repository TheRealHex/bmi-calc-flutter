import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField(heightController, 'Height (ft)', '6.1'),
            textField(weightController, 'Weight (kg)', '70'),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Calculate'))
          ],
        ),
      ),
    );
  }

  textField(TextEditingController controller, String label, String hint) {
    return SizedBox(
      width: 200,
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
