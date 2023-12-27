import 'package:dio/dio.dart';
import '../model/endereco_model.dart';

class EnderecoRepositorio {
  Dio _dio = Dio();

  Future<Endereco> fetchEndereco(String cep) async {
    try {
      Response response = await _dio.get('https://viacep.com.br/ws/$cep/json/');
      Map<String, dynamic> data = response.data;

      if (data.isNotEmpty) {
        return Endereco.fromJson(data);
      } else {
        throw Exception('Endereço não encontrado para o CEP informado.');
      }
    } catch (error) {
      throw Exception('Erro na requisição: $error');
    }
  }
}
