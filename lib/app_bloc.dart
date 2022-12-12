import 'dart:developer';

import 'package:flutter/foundation.dart';

enum TabList { home, library, myList, account }

class AppBloc with ChangeNotifier {
  late int _currentTab = 0;
  int get currentTab => _currentTab;

  AppBloc() {
    _currentTab = 0;
    if (kDebugMode) {
      print(currentTab);
    }
  }

  changeTab(int tabIndex) {
    _currentTab = tabIndex;
    log('Current Tab page is  ${TabList.values[tabIndex].name}');
    notifyListeners();
    //return ;
  }
}
