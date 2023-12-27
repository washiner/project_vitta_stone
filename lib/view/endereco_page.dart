import 'package:flutter/material.dart';

import '../controller/endereco_controller.dart';

class EnderecoPage extends StatefulWidget {
  @override
  _EnderecoPageState createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
  final EnderecoController _enderecoController = EnderecoController();
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Via CEP Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite o CEP'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String cep = _cepController.text;
                await _enderecoController.fetchEndereco(cep);
                setState(() {});
              },
              child: Text('Buscar Endereço'),
            ),
            SizedBox(height: 16),
            _enderecoController.endereco != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CEP: ${_enderecoController.endereco!.cep}'),
                      Text(
                          'Logradouro: ${_enderecoController.endereco!.logradouro}'),
                      Text(
                          'Complemento: ${_enderecoController.endereco!.complemento}'),
                      Text('Bairro: ${_enderecoController.endereco!.bairro}'),
                      Text(
                          'Localidade: ${_enderecoController.endereco!.localidade}'),
                      Text('UF: ${_enderecoController.endereco!.uf}'),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
