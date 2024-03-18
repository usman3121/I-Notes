import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Divider(
            color: Colors.black,
          )),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'or',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: Colors.black,
        ),
      ),
    ]);
  }
}