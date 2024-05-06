import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machine_test/pages/home.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {;
    return MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
      debugShowCheckedModeBanner: false,
        home: home_Page()
    );
  }
}

