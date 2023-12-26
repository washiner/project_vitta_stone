import 'package:flutter/material.dart';

class PassagemParametro extends StatefulWidget {
  const PassagemParametro({ Key? key }) : super(key: key);

  @override
  State<PassagemParametro> createState() => _PassagemParametroState();
}

class _PassagemParametroState extends State<PassagemParametro> {

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passagem de parametro"),
      ),
      body: Column(
        children: [
          Center(
            child: TextFormField(
              controller: _textController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: "Digite seu nome",
                hintText: "aqui",
                labelStyle: TextStyle(
                  // Adiciona o estilo para centralizar o texto do rótulo
                  color: Colors.blue, // Altere para a cor desejada
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              String nome;
              setState(() {
                nome = _textController.text;
                Navigator.pushNamed(context, '/', arguments: nome);
              });
            },
            child: const Text("Enviar"),
          ),
        ],
      ),
    );
  }
}