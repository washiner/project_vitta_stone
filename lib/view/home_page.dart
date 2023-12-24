import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My APP Bloc'),
      ),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Center(
                child: Text(
                  index.toString(),
                ),
              ),
            ),
            title: Text('tarefa ${index.toString()}'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_rounded),
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
  @override
  void dispose() {
    //por enquanto vazio
    super.dispose();
  }
}