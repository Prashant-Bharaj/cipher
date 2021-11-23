import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController cTextController = TextEditingController(text: "own");
TextEditingController decKeyController = TextEditingController(text: "14 21 13");
String? originalText;

class VernamDecryptionAuto extends StatefulWidget {
  const VernamDecryptionAuto({Key? key}) : super(key: key);

  @override
  _VernamDecryptionAutoState createState() => _VernamDecryptionAutoState();
}

class _VernamDecryptionAutoState extends State<VernamDecryptionAuto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vernam Cipher Decryption"),
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
                // defaultValue: "hello",
              ),
              const SizedBox(
                height: 15.0,
              ),
              const CustomText(
                text: "Enter Key",
              ),
              CustomField(
                textEditingController: decKeyController,
                // defaultValue: "abcde",
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
    List<String> decKeys = List.filled(0, "",growable: true);
    decKeys.addAll(decKey.split(" "));
    String cipherChars="";
    for(int i = 0 ; i< cText.length; i++){
      print("${cText.codeUnits[i] ^ int.parse(decKeys[i])}");
      cipherChars += String.fromCharCode(cText.codeUnits[i] ^ int.parse(decKeys[i]));
    }
    setState(() {
      originalText = cipherChars;
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
