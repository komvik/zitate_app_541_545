import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ZitatScreen extends StatelessWidget {
  ZitatScreen({super.key});

  String quote =
      "I always seem to have a vague feeling that he is a Satan among musicians,"
      " a fallen angel in the darkness who is perpetually seeking to fight his way back to happiness.";
  String author = "Havelock Ellis";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 230, 182),
      appBar: AppBar(
        title: const Text("Quote App"),
        titleTextStyle: const TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: const Color.fromARGB(255, 241, 224, 160),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              child: Text(
                quote,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Text(
              author,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {}, child: const Text("click for new quote")),
          ],
        ),
      ),
    );
  }
}
