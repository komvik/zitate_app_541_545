import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zitate_app_541_545/futures/repository/json_repository.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ZitatScreen extends StatefulWidget {
  const ZitatScreen({super.key});

  @override
  State<ZitatScreen> createState() => _ZitatScreenState();
}

class _ZitatScreenState extends State<ZitatScreen> {
//    JSON
  String quoteStr = "Start";
  String authorStr = "Start";
  String categoryStr = "Start";
//    REPO
  bool isLoading = false; //für indikator
  JsonRepository jsonRepository = JsonRepository();
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
      quoteStr = allData["quote"];
      authorStr = allData["author"];
      categoryStr = allData["category"];
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
                quoteStr,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Text(
              authorStr,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              categoryStr,
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

//______________________________________________
Future<String> getData() async {
  final Uri uri = Uri.https('api.api-ninjas.com', '/v1/quotes');

  final http.Response response = await http.get(uri,
      headers: {'x-api-key': 'N3GBHnowDETYID/byVicqQ==Pzz67MSAYJwayc9Z'});

  if (response.statusCode == 200) {
    return response.body;
  }

  return "Fehler";
}
