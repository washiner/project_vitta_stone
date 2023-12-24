import 'package:bloc_pattern_exemple/view/home_page.dart';
import 'package:bloc_pattern_exemple/view/list_view_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: const TextTheme(
          bodyText2: TextStyle( fontSize: 22,
            color: Colors.black,
          ),
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/list_view_page': (context) => const ListViewPage()
      },
    );
  }
}
