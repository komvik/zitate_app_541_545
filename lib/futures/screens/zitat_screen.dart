import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:zitate_app_541_545/futures/models/get_data.dart';
import 'package:zitate_app_541_545/futures/models/quote.dart';
import 'package:zitate_app_541_545/futures/models/shared_preferences_quote.dart';
import 'package:zitate_app_541_545/futures/widgets/text_quote.dart';

// ignore: must_be_immutable
class ZitatScreen extends StatefulWidget {
  const ZitatScreen({super.key});

  @override
  State<ZitatScreen> createState() => _ZitatScreenState();
}

class _ZitatScreenState extends State<ZitatScreen> {
  Quote clQuote = Quote(
      quoteStr: "",
      authorStr: "Press Button",
      categoryStr: "Click for new quote");

  @override
  void initState() {
    super.initState();
    loadSavedQuote();
  }

  // Load
  void loadSavedQuote() async {
    final savedQuote = await SharedPreferencesQuote.getSavedQuote();
    if (savedQuote != null) {
      setState(() {
        clQuote = savedQuote;
      });
    }
  }

  // Get
  void getQuote() async {
    final String qData = await getData(); // Daten API
    final Map<String, dynamic> allData = jsonDecode(qData)[0];
    final newQuote = Quote(
      quoteStr: allData["quote"],
      authorStr: allData["author"],
      categoryStr: allData["category"],
    );
    setState(() {
      clQuote = newQuote;
    });

    // Save zitat
    await SharedPreferencesQuote.saveQuote(newQuote);
  }

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
              child: TextQuote(data: clQuote.quoteStr),
            ),
            TextQuote(data: clQuote.authorStr),
            const SizedBox(height: 30),
            TextQuote(data: clQuote.categoryStr),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: getQuote, child: const Text("click for new quote")),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  // Löschen des gespeicherten Zitats
                  await SharedPreferencesQuote.deleteQuote();
                  setState(() {
                    clQuote = Quote(
                        quoteStr: "",
                        authorStr: "Press Button",
                        categoryStr: "Click for new quote");
                  });
                },
                child: const Text("Delete last quote")),
          ],
        ),
      ),
    );
  }
}
