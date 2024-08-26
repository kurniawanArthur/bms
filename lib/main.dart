import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'pages/home.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import "pages/splash.dart";
import 'pages/dashboard.dart';
import 'pages/tuning.dart';
import 'pages/statistics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
