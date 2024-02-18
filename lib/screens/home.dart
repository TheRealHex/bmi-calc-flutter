import 'package:flutter/material.dart';

String result = '';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        child: result.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textField(heightController, 'Height (ft)', '6.1'),
                  textField(weightController, 'Weight (kg)', '70'),
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
                  Text(result),
                  const SizedBox(height: 20),
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
    setState(() {
      result = 'Something.';
    });
  }

  SizedBox textField(
      TextEditingController controller, String label, String hint) {
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
