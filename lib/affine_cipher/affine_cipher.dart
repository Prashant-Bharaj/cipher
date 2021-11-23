import 'package:cipher/widgets/custom_round_button.dart';
import 'package:flutter/material.dart';

class AffineCipher extends StatefulWidget {
  const AffineCipher({Key? key}) : super(key: key);

  @override
  _AffineCipherState createState() => _AffineCipherState();
}

class _AffineCipherState extends State<AffineCipher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affine Cipher"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Encryption", route: "/affineEncrypt"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const RoundButton(text: "Decryption", route: "/affineDecrypt"),
        ],
      ),
    );
  }
}