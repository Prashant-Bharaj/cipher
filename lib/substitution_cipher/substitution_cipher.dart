import 'package:cipher/widgets/custom_round_button.dart';
import 'package:flutter/material.dart';

class SubstitutionCipher extends StatefulWidget {
  const SubstitutionCipher({Key? key}) : super(key: key);

  @override
  _SubstitutionCipherState createState() => _SubstitutionCipherState();
}

class _SubstitutionCipherState extends State<SubstitutionCipher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Substitution Cipher"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Encryption", route: "/substitutionEncrypt"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Decryption", route: "/substitutionDecrypt"),
        ],
      ),
    );
  }
}