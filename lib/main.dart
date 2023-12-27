import 'package:flutter/material.dart';
import 'view/endereco_page.dart';
import 'view/home_page.dart';
import 'view/list_view_page.dart';
import 'view/passagem_parametro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/list_view_page': (context) => const ListViewPage(),
        '/passagem_parametro': (context) => const PassagemParametro(),
        '/endereco_page': (context) => EnderecoPage()
      },
    );
  }
}
