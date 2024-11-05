import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];
  var token = "";
  var username = "";

  GlobalKey? historyListKey;
  var favorites = <WordPair>[];  
}
