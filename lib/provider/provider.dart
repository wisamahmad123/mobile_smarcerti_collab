import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String _appBarTitle = 'Halaman Utama';

  String get appBarTitle => _appBarTitle;

  setAppBarTitle(String title) {
    _appBarTitle = title;
    notifyListeners();
  }
}