import 'package:cipher/substitution_cipher/substitution_cipher.dart';
import 'package:cipher/substitution_cipher/substitution_decryption.dart';
import 'package:cipher/substitution_cipher/substitution_encryption.dart';
import 'package:cipher/vernam_cipher_auto/vernam_cipher_auto.dart';
import 'package:cipher/vernam_cipher_auto/vernam_decryption_auto.dart';
import 'package:cipher/vernam_cipher_auto/vernam_encryption_auto.dart';
import 'package:cipher/vigener_cipher/vigener_cipher.dart';
import 'package:cipher/vigener_cipher/vigener_decryption.dart';
import 'package:cipher/vigener_cipher/vigener_encryption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Vernam_cipher/vernam_cipher.dart';
import 'Vernam_cipher/vernam_decryption.dart';
import 'Vernam_cipher/vernam_encryption.dart';
import 'affine_cipher/affine_cipher.dart';
import 'affine_cipher/affine_decryption.dart';
import 'affine_cipher/affine_encryption.dart';
import 'cipher_home/cipher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Cipher(),
        '/vigenerCipher': (context) => const VigenerCipher(),
        '/vigenerEncrypt': (context) => const VigenerEncryption(),
        '/vigenerDecrypt': (context) => const VigenerDecryption(),
        '/vernamCipher': (context) => const VernamCipher(),
        '/vernamEncrypt': (context) => const VernamEncryption(),
        '/vernamDecrypt': (context) => const VernamDecryption(),
        '/affineCipher': (context) => const AffineCipher(),
        '/affineEncrypt': (context) => const AffineEncryption(),
        '/affineDecrypt': (context) => const AffineDecryption(),
        '/substitutionCipher':(context) => const SubstitutionCipher(),
        '/substitutionEncrypt': (context) => const SubstitutionEncryption(),
        '/substitutionDecrypt': (context) => const SubstitutionDecryption(),
        '/vernamCipherAuto': (context) => const VernamCipherAuto(),
        '/vernamEncryptAuto': (context) => const VernamEncryptionAuto(),
        '/vernamDecryptAuto': (context) => const VernamDecryptionAuto(),
      },
    ),
  );
}






