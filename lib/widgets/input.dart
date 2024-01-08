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
      width: 30,
      child: TextField(
        maxLength: 3,
        decoration: InputDecoration(hintText: hint, counterText: ''),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
