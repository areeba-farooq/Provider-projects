import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  // String? name;
  // String? email;
  // String? password;

  int activeIndex = 0;
  int totalIndex = 3;

  void changeStep(int index) {
    activeIndex = index;
    notifyListeners();
  }
}
