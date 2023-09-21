import 'dart:convert';
import 'dart:developer';

import 'package:angular_emulation/src/models/quote.dart';
import 'package:http/http.dart' as http;

class QuotesService {

  final url = 'https://api.quotable.io/random';

  Future<Quote> getRandomQuote() async {
    final response = await http.get(Uri.parse(url));
    inspect(response);
    if(response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to load quote");
    }
  }
}