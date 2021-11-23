import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController cTextController = TextEditingController(text: "acce");
TextEditingController decKeyController = TextEditingController(text: "ab");
String? originalText;

class VigenerDecryption extends StatefulWidget {
  const VigenerDecryption({Key? key}) : super(key: key);

  @override
  _VigenerDecryptionState createState() => _VigenerDecryptionState();
}

class _VigenerDecryptionState extends State<VigenerDecryption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vigener Cipher Decryption"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "Enter Cipher Text"),
              CustomField(
                textEditingController: cTextController,
                // defaultValue: "acce",
              ),
              const SizedBox(
                height: 15.0,
              ),
              const CustomText(
                text: "Enter Key",
              ),
              CustomField(
                textEditingController: decKeyController,
                // defaultValue: "ab",
              ),
              const SizedBox(height: 10.0),
              Center(
                child: buildTextButton(context,"Decrypt"),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const CustomText(text: "Original Text"),
              SelectableOutput(text: originalText ?? ""),
            ],
          ),
        ),
      ),
    );
  }

  void decrypt() {
    String cText = cTextController.text;
    String decKey = decKeyController.text;
    cText = cText.toLowerCase();
    decKey = decKey.toLowerCase();
    List cChars = List.filled(0, null, growable: true);
    List keyChars = List.filled(0, null, growable: true);
    cChars.addAll(cText.split(""));
    keyChars.addAll(decKey.split(""));
    List fullKey = List.filled(0, null, growable: true);
    for (int i = 0, c = 0; i < cChars.length; c = ++c % keyChars.length, i++) {
      fullKey.add(keyChars[c]);
    }
    List<int> cipherChars = List.filled(0, 0, growable: true);
    for (int i = 0; i < cChars.length; i++) {
      cipherChars.add((((26 +
                  cChars[i].toString().codeUnitAt(0) -
                  fullKey[i].toString().codeUnitAt(0)) %
              26) +
          97));
    }
    setState(() {
      originalText = String.fromCharCodes(cipherChars);
    });
  }

  TextButton buildTextButton(BuildContext context,String text) {
    return TextButton(
      onPressed: decrypt,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          elevation: 2.0,
          color: ThemeData.fallback().backgroundColor,
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
