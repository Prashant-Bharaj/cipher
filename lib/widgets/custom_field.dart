import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  // final String defaultValue;
  const CustomField({
    Key? key,
    required this.textEditingController,
    this.textInputType,
    // required this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 2.0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: TextFormField(
          controller: textEditingController,
          keyboardType: textInputType ?? TextInputType.text,
          style: const TextStyle(fontSize: 24.0),
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return "Please enter some text";
          //   }
          //   return null;
          // },
          decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}