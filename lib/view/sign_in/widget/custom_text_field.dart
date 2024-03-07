import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final int? maxLength;
  final String? Function(String?)? validator;
  const CustomTextField(
      {required this.hintText,
      this.textEditingController,
      this.maxLength,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.grey, width: 1)),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration:
                  InputDecoration(hintText: hintText, border: InputBorder.none),
              controller: textEditingController,
              inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
              validator: validator,
            )));
  }
}
