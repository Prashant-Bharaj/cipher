import 'dart:math';

import 'package:cipher/substitution_cipher/substitution_encryption.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final bool? autoButton;
  // final String defaultValue;
  const CustomField({
    Key? key,
    required this.textEditingController,
    this.textInputType,
    this.autoButton,
    // required this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 2.0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            if(autoButton != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(18.0),
                    elevation:4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextButton(child: Text("Auto"),
                        onPressed: (){
                        Random r = Random();
                          substitutionCipherEncryptionKeyController.text = r.nextInt(27).toString();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            TextFormField(
              controller: textEditingController,
              keyboardType: textInputType ?? TextInputType.text,
              style: const TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ],
        ),
      ),
    );
  }
}