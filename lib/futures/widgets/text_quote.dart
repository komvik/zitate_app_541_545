import 'package:flutter/material.dart';

class TextQuote extends StatelessWidget {
  const TextQuote({
    super.key,
    required this.data,
  });
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(fontSize: 20),
    );
  }
}
