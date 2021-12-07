import 'package:flutter/material.dart';

class SelectableOutput extends StatelessWidget {
  final double? height;
  final String text;
  final bool? isValid;
  const SelectableOutput({
    Key? key, required this.text, this.height, this.isValid=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 2.0,
      child: SizedBox(
        height: height ?? MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: SelectableText(
              text,
              style:
              TextStyle(fontSize: 30.0, color: isValid == true? Colors.blue : Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}