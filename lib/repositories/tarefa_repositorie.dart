import '../model/tarefa_model.dart';

class TarefaRepositorie {
  final List<TarefaModel> _tarefas = [];
  //crio uma lista de tarefa model iniciando como vazio

  Future<List<TarefaModel>> getTarefas() async {
    //no futuro vamos retornar uma lista de tarefa model
    //adiciona outra lista dentro dela
    _tarefas.addAll([
      TarefaModel(nome: "Fazer caminhada"),
      TarefaModel(nome: "Jantar com os pais"),
      TarefaModel(nome: "Ir na piscina"),
      TarefaModel(nome: "Lavar a louça")
    ]);
    return Future.delayed(
      //simulando uma requisao de uma api depois de 2 segundos retorna nossa lista de tarefas ja com os dados
      const Duration(seconds: 2),
      (() => _tarefas),
    );
  }

  Future<List<TarefaModel>> postTarefas({required TarefaModel tarefa}) async {
    _tarefas.add(tarefa);
    return Future.delayed(const Duration(seconds: 2), () {
      return _tarefas;
    });
  }

  Future<List<TarefaModel>> deleteTarefa({required TarefaModel tarefa}) async {
    _tarefas.remove(tarefa);
    return Future.delayed(const Duration(seconds: 2), () => _tarefas);
  }
}
