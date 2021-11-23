import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController cTextController = TextEditingController(text: "djkmfkxp");
String? originalText;
double currentSliderValueA = 3;
double currentSliderValueB = 10;

class AffineDecryption extends StatefulWidget {
  const AffineDecryption({Key? key}) : super(key: key);

  @override
  _AffineDecryptionState createState() => _AffineDecryptionState();
}

class _AffineDecryptionState extends State<AffineDecryption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affine Cipher Decryption"),
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
              const CustomText(text: "Pick the coefficient values"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "a",
                    style:
                    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Slider(
                      value: currentSliderValueA,
                      min: 1,
                      max: 25,
                      divisions: 12,
                      onChanged: (double value) {
                        setState(() {
                          if (value != 13) {
                            currentSliderValueA = value;
                            print(value);
                          }
                        });
                      },
                    ),
                  ),
                  Material(
                    elevation: 0.5,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$currentSliderValueA"),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "b",
                    style:
                    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Slider(
                      value: currentSliderValueB,
                      min: 0,
                      max: 25,
                      divisions: 25,
                      onChanged: (double value) {
                        setState(() {
                          currentSliderValueB = value.floorToDouble();
                          print(value);
                        });
                      },
                    ),
                  ),
                  Material(
                    elevation: 0.5,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$currentSliderValueB"),
                    ),
                  )
                ],
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

  int modeInverse(int a, int m){
    for(int x = 1; x <m; x++) {
      if(((a%m) * (x%m))%m == 1) {
        return x;
      }
    }
     return 0;
  }
  void decrypt() {
    String cText = cTextController.text;
    String cipherChars="";
    for(int i = 0 ; i< cText.length; i++){
      cipherChars += String.fromCharCode((((modeInverse(currentSliderValueA.toInt(),26) * (cText.codeUnits[i]-97- currentSliderValueB).toInt())%26)+97));
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
