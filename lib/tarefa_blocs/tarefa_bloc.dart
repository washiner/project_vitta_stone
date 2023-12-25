import 'dart:async';

import 'package:bloc_pattern_exemple/model/tarefa_model.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_event.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_state.dart';
import 'package:bloc_pattern_exemple/tarefa_repositories/tarefa_repositorie.dart';

class TarefaBloc {
  final _repository = TarefaRepositorie();

  final StreamController<TarefaEvent> _inputTarefaController =
      StreamController<TarefaEvent>();
  final StreamController<TarefaState> _outputTarefaController =
      StreamController<TarefaState>();

  Sink<TarefaEvent> get inputTarefa => _inputTarefaController.sink;
  Stream<TarefaState> get outputTarefa => _outputTarefaController.stream;

  TarefaBloc() {
    _inputTarefaController.stream.listen(_mapEventState);
  }
  void _mapEventState(TarefaEvent event) async {
    List<TarefaModel> tarefas = [];

    _outputTarefaController.add(TarefaLoadingState());
    if(event is GetTarefas){
      tarefas = await _repository.getTarefas();
    }else if(event is PostTarefas){
      tarefas = await _repository.postTarefas(tarefa: event.tarefa);
    }else if(event is DeleteTarefas){
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }
    _outputTarefaController.add(TarefaLoadedState(tarefas: tarefas));
  }
}
