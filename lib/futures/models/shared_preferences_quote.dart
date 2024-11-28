import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zitate_app_541_545/futures/models/quote.dart';

class SharedPreferencesQuote {
  static const String keyQuote = "letzteQuote";

  // Save
  static Future<void> saveQuote(Quote quote) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode({
      "quote": quote.quoteStr,
      "author": quote.authorStr,
      "category": quote.categoryStr,
    });
    await prefs.setString(keyQuote, jsonString);
  }

  // Get
  static Future<Quote?> getSavedQuote() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(keyQuote);
    if (jsonString == null) {
      return null; // Kein Zitat gespeichert
    }
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return Quote(
      quoteStr: jsonMap["quote"],
      authorStr: jsonMap["author"],
      categoryStr: jsonMap["category"],
    );
  }

  // Delete
  static Future<void> deleteQuote() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyQuote);
  }
}
