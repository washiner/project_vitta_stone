import 'package:bloc_pattern_exemple/view/list_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voce esta na Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'List View Page',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2?.color,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/list_view_page');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Projeto Viita Stone"),
      ),
    );
  }
}
