import 'dart:convert';
import 'dart:developer';

// class Quote {
//   final String quote;
//   final String author;
//   final String category;

//   Quote({required this.quote, required this.author, required this.category});
// }

class JsonRepository {
  void getData() {
    final quoteMap = jsonDecode(jsonDataString);
    List<String> quote = quoteMap[0]['quote'];
    List<String> author = quoteMap[0]['author'];
    List<String> category = quoteMap[0]['category'];
    log("$quote" "\n" "$author" "\n" "$category");
  }
}

const jsonDataString = """[
  {
    "quote": "I always seem to have a vague feeling that he is a Satan among musicians, a fallen angel in the darkness who is perpetually seeking to fight his way back to happiness.",
    "author": "Havelock Ellis",
    "category": "happiness"
  }
]
""";
