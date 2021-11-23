import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String route;
  final String text;
  const RoundButton({
    Key? key,
    required this.route,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        // child: Text(text)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: 2.0,
            color: ThemeData.fallback().backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}