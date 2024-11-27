import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:zitate_app_541_545/futures/models/get_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zitate_app_541_545/futures/models/quote.dart';

// ignore: must_be_immutable
class ZitatScreen extends StatefulWidget {
  const ZitatScreen({super.key});

  @override
  State<ZitatScreen> createState() => _ZitatScreenState();
}

class _ZitatScreenState extends State<ZitatScreen> {
  Quote clQuote = Quote(
      quoteStr: "quoteStr", authorStr: "authorStr", categoryStr: "categoryStr");
//    JSON

//    REPO
//  bool isLoading = false; //für indikator
// JsonRepository jsonRepository = JsonRepository();
//    INI
  @override
  void initState() {
    super.initState();
    getQuote();
  }

//    READ JSON
  void getQuote() async {
    final String qData = await getData();
    final Map<String, dynamic> allData = jsonDecode(qData)[0];
    setState(() {
      clQuote.quoteStr = allData["quote"];
      clQuote.authorStr = allData["author"];
      clQuote.categoryStr = allData["category"];
    });
  }

//
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
                clQuote.quoteStr,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Text(
              clQuote.authorStr,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              clQuote.categoryStr,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  getQuote();
                },
                child: const Text("click for new quote")),
          ],
        ),
      ),
    );
  }
}

//   SharedPref.
class SharedPreferencesQuote {
  static const String keyStringList = "ksl";

  //Save
  static Future<void> saveStringList(List<String> stringList) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(stringList);
    await prefs.setString(keyStringList, jsonString);
  }

  // Get
  static Future<List<String>> getStringList() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(keyStringList);
    if (jsonString == null) {
      return [];
    }
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => e.toString()).toList();
  }
}
