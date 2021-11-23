import 'package:cipher/widgets/custom_round_button.dart';
import 'package:flutter/material.dart';

class VernamCipher extends StatefulWidget {
  const VernamCipher({Key? key}) : super(key: key);

  @override
  _VernamCipherState createState() => _VernamCipherState();
}

class _VernamCipherState extends State<VernamCipher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vernam Cipher"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Encryption", route: "/vernamEncrypt"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Decryption", route: "/vernamDecrypt"),
        ],
      ),
    );
  }
}