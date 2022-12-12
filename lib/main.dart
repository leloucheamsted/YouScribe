import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_run/app_bloc.dart';
import 'package:test_run/app_widget.dart';
import 'package:test_run/common/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ColorPalette.actionColor, // status bar color
        systemNavigationBarDividerColor: ColorPalette.primaryColor,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: ColorPalette.primaryColor));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'YouScribe',
          theme: ThemeData(
              primarySwatch: Colors.orange, brightness: Brightness.light),
          debugShowCheckedModeBanner: false,
          home: const AppWidget(),
        ));
  }
}
