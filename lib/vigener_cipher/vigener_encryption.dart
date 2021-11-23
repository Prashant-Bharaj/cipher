import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController ptController = TextEditingController(text: "abcd");
TextEditingController encKeyController = TextEditingController(text: "ab");
String? cipherText;

class VigenerEncryption extends StatefulWidget {
  const VigenerEncryption({Key? key}) : super(key: key);
  @override
  _VigenerEncryptionState createState() => _VigenerEncryptionState();
}

class _VigenerEncryptionState extends State<VigenerEncryption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vigener Cipher Encryption"),
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
                // defaultValue: "abcd",
              ),
              const SizedBox(
                height: 15.0,
              ),
              const CustomText(
                text: "Enter Key",
              ),
              CustomField(
                textEditingController: encKeyController,
                // defaultValue: "ab",
              ),
              const SizedBox(height: 10.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    String pt = ptController.text;
                    String key = encKeyController.text;
                    pt = pt.toLowerCase();
                    key = key.toLowerCase();
                    List ptChars = List.filled(0, null, growable: true);
                    List keyChars = List.filled(0, null, growable: true);
                    ptChars.addAll(pt.split(""));
                    keyChars.addAll(key.split(""));
                    List fullKey = List.filled(0, null, growable: true);
                    for (int i = 0, c = 0;
                    i < ptChars.length;
                    c = ++c % keyChars.length, i++) {
                      fullKey.add(keyChars[c]);
                    }
                    List<int> cipherChars = List.filled(0, 0, growable: true);
                    for (int i = 0; i < ptChars.length; i++) {
                      cipherChars.add((((fullKey[i].toString().codeUnitAt(0) +
                          ptChars[i].toString().codeUnitAt(0) -
                          194) %
                          26) +
                          97));
                    }

                    setState(() {
                      cipherText = String.fromCharCodes(cipherChars);
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
              SelectableOutput(text: cipherText??"",),
            ],
          ),
        ),
      ),
    );
  }
}
