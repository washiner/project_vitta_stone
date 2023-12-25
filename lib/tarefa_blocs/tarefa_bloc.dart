import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_exemple/model/tarefa_model.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_event.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_state.dart';
import 'package:bloc_pattern_exemple/tarefa_repositories/tarefa_repositorie.dart';

class TarefaBloc extends Bloc<TarefaEvent, TarefaState>{
  final _repository = TarefaRepositorie();

  TarefaBloc() : super(TarefaInitialState()) {
    on(_mapEventState);
  }
  void _mapEventState(TarefaEvent event, Emitter emit) async {
    List<TarefaModel> tarefas = [];

    emit(TarefaLoadingState());
    if(event is GetTarefas){
      tarefas = await _repository.getTarefas();
    }else if(event is PostTarefas){
      tarefas = await _repository.postTarefas(tarefa: event.tarefa);
    }else if(event is DeleteTarefas){
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }
    emit(TarefaLoadedState(tarefas: tarefas));
  }
}
