import 'package:cipher/widgets/custom_field.dart';
import 'package:cipher/widgets/custom_text.dart';
import 'package:cipher/widgets/selectable_output.dart';
import 'package:flutter/material.dart';

TextEditingController ptController = TextEditingController(text: "prashant");

String? cipherText;
double currentSliderValueA = 3;
double currentSliderValueB = 10;

class AffineEncryption extends StatefulWidget {
  const AffineEncryption({Key? key}) : super(key: key);

  @override
  _AffineEncryptionState createState() => _AffineEncryptionState();
}

class _AffineEncryptionState extends State<AffineEncryption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affine Cipher Encryption"),
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
                child: TextButton(
                  onPressed: () {
                    String pt = ptController.text;
                    pt = pt.toLowerCase();

                    List ptChars = List.filled(0, null, growable: true);
                    ptChars.addAll(pt.split(""));

                    String cipherChars = "";

                    for (int i = 0; i < pt.length; i++) {
                      cipherChars += String.fromCharCode(
                          (((pt.codeUnits[i] - 97)*currentSliderValueA.toInt() + currentSliderValueB.toInt()) %26
                              )+97);
                    }
                    setState(() {
                      cipherText = cipherChars;
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
