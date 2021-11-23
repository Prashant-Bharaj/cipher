import 'package:cipher/widgets/custom_round_button.dart';
import 'package:flutter/material.dart';

class VernamCipherAuto extends StatefulWidget {
  const VernamCipherAuto({Key? key}) : super(key: key);

  @override
  _VernamCipherAutoState createState() => _VernamCipherAutoState();
}

class _VernamCipherAutoState extends State<VernamCipherAuto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vernam Cipher (auto key)"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Encryption", route: "/vernamEncryptAuto"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Decryption", route: "/vernamDecryptAuto"),
        ],
      ),
    );
  }
}