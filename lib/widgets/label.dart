import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    this.text = '',
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
    );
  }
}
