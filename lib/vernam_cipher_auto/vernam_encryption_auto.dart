import 'dart:math';

import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController ptController = TextEditingController(text: "abc");

String? cipherText;
String? encryptionKey;
Random random = Random();

class VernamEncryptionAuto extends StatefulWidget {
  const VernamEncryptionAuto({Key? key}) : super(key: key);

  @override
  _VernamEncryptionAutoState createState() => _VernamEncryptionAutoState();
}

class _VernamEncryptionAutoState extends State<VernamEncryptionAuto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vernam Cipher Encryption"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "Enter Plain Text"),
              CustomField(
                textEditingController: ptController,
                // defaultValue: "hello",
              ),
              const SizedBox(
                height: 15.0,
              ),
              const SizedBox(height: 10.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    String pt = ptController.text;
                    String cipherChars = "";
                    String key = "";
                    var keys = List.generate(pt.length, (index) => random.nextInt(26));
                    for(var i in keys){
                      key +="$i ";
                    }
                    for (int i = 0; i < pt.length; i++) {
                      print(
                          "${((pt.codeUnits[i]) ^ keys[i])}");
                      cipherChars += String.fromCharCode(
                          ((pt.codeUnits[i]) ^ keys[i]));
                    }

                    setState(() {
                      cipherText = cipherChars;
                      encryptionKey = key;
                      // print(cipherText);
                    });
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      elevation: 2.0,
                      color: ThemeData.fallback().backgroundColor,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Encrypt",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const CustomText(text: "Cipher Text"),
              SelectableOutput(
                text: cipherText ?? "",
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const CustomText(text: "Encryption Key"),
              SelectableOutput(
                text: encryptionKey ?? "",
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
