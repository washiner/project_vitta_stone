import 'package:bloc_pattern_exemple/repositories/endereco_repositorie.dart';

import '../model/endereco_model.dart';

class EnderecoController {
  final EnderecoRepositorio _repositorio = EnderecoRepositorio();
  Endereco? _endereco;

  Endereco? get endereco => _endereco;

  Future<void> fetchEndereco(String cep) async {
    try {
      _endereco = await _repositorio.fetchEndereco(cep);
    } catch (error) {
      print('Erro ao obter endereço: $error');
    }
  }
}
