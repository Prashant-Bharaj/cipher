import 'package:cipher/widgets/custom_round_button.dart';
import 'package:flutter/material.dart';

class VigenerCipher extends StatefulWidget {
  const VigenerCipher({Key? key}) : super(key: key);

  @override
  _VigenerCipherState createState() => _VigenerCipherState();
}

class _VigenerCipherState extends State<VigenerCipher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vigener Cipher"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Encryption", route: "/vigenerEncrypt"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Decryption", route: "/vigenerDecrypt"),
        ],
      ),
    );
  }
}