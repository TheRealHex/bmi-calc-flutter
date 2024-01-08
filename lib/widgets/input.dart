import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    this.hint = '',
  });
  final String hint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextField(
        maxLength: 3,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
        decoration: InputDecoration(
          hintText: hint,
          focusColor: Colors.blue,
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.grey),
          counterText: '',
        ),
        cursorColor: Colors.blue,
        textAlign: TextAlign.right,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
