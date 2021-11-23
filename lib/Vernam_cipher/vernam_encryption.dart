import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController ptController = TextEditingController(text: "vernam");
TextEditingController encKeyController = TextEditingController(text: "cipher");
String? cipherText;
var c = ['a', 'b', 'c', 'd', 'e', 'f','g', 'h', 'i', 'j', 'k', 'l','m', 'n', 'o', 'p', 'q', 'r','s', 't', 'u', 'v', 'w', 'x','y', 'z','A', 'B', 'C', 'D', 'E', 'F'];

class VernamEncryption extends StatefulWidget {
  const VernamEncryption({Key? key}) : super(key: key);

  @override
  _VernamEncryptionState createState() => _VernamEncryptionState();
}

class _VernamEncryptionState extends State<VernamEncryption> {
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
              const CustomText(
                text: "Enter Key",
              ),
              CustomField(
                textEditingController: encKeyController,
              ),
              const SizedBox(height: 10.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    String pt = ptController.text;
                    String key = encKeyController.text;
                    pt = pt.toLowerCase();
                    key = key.toLowerCase();
                    if(pt.length != key.length){
                       setState(() {
                         cipherText = "!!!key and plain text length doesn't match!!!";
                       });
                    }
                    else {
                      String cipherChars="";
                      for(int i = 0 ; i< pt.length; i++){
                        cipherChars += c[(pt.codeUnitAt(i)-97) ^ (key.codeUnitAt(i)-97)];
                      }

                    setState(() {
                      cipherText = cipherChars;
                    });
                    }
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
