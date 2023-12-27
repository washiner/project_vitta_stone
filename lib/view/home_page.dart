import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {

    final String? nome = ModalRoute.of(context)?.settings.arguments as String?;

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
                nome != null ? 'Bem-vindo, $nome' : 'Menu',
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
             ListTile(
              title: Text(
                'Passagem de Parametro',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2?.color,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/passagem_parametro');
              },
            ),
            ListTile(
              title: Text(
                'Buscar endereço pelo Cep',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2?.color,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/endereco_page');
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
