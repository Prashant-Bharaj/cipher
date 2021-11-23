import 'package:cipher/widgets/custom_round_button.dart';
import 'package:flutter/material.dart';


class Cipher extends StatefulWidget {
  const Cipher({Key? key}) : super(key: key);

  @override
  _CipherState createState() => _CipherState();
}

class _CipherState extends State<Cipher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Ciphers"),),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const RoundButton(route: "/vigenerCipher", text: "Vigener Cipher"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const RoundButton(route: "/vernamCipher", text: "Vernam Cipher"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const RoundButton(route: "/affineCipher", text: "Affine Cipher"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const RoundButton(route: "/substitutionCipher", text: "Substitution Cipher",),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const RoundButton(route: "/vernamCipherAuto", text: "Vernam Cipher (auto key)",),
              ]
          ),
        ),
    );
  }
}