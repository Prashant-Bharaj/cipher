import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController ptController = TextEditingController(text: "abc");
TextEditingController substitutionCipherEncryptionKeyController =
    TextEditingController(text: "3");
String? substitutionCipherText;
bool isValid = true;

class SubstitutionEncryption extends StatefulWidget {
  const SubstitutionEncryption({Key? key}) : super(key: key);

  @override
  _SubstitutionEncryptionState createState() => _SubstitutionEncryptionState();
}

class _SubstitutionEncryptionState extends State<SubstitutionEncryption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Substitution Cipher Encryption"),
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
              const CustomText(
                text: "Enter Key",
              ),
              CustomField(
                textEditingController:
                    substitutionCipherEncryptionKeyController,
                textInputType: TextInputType.number,
                autoButton: true,
              ),
              const SizedBox(height: 10.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    String pt = ptController.text;
                    String key = substitutionCipherEncryptionKeyController.text;
                    String cipherChars = "";

                    RegExp regExp = RegExp(r"^[a-z]*$");
                    RegExp regExpKey = RegExp(r"^[0-9]*$");
                    if (pt.isEmpty ||
                        key.isEmpty ||
                        !regExp.hasMatch(pt) ||
                        !regExpKey.hasMatch(key)) {
                      isValid = false;
                      cipherChars = "Invalid Input";
                    } else {
                      isValid = true;
                      int numericKey = int.parse(key);
                      for (int i = 0; i < pt.length; i++) {
                        cipherChars += String.fromCharCode(
                            (((pt.codeUnits[i] - 97) + numericKey) % 26) + 97);
                      }
                    }
                    setState(() {
                      substitutionCipherText = cipherChars;
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
                  text: substitutionCipherText ?? "", isValid: isValid),
            ],
          ),
        ),
      ),
    );
  }
}
