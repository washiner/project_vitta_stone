import 'package:bloc/bloc.dart';
import '../model/tarefa_model.dart';
import '../repositories/tarefa_repositorie.dart';
import 'tarefa_event.dart';
import 'tarefa_state.dart';

class TarefaBloc extends Bloc<TarefaEvent, TarefaState> {
  final _repository = TarefaRepositorie();

  TarefaBloc() : super(TarefaInitialState()) {
    on(_mapEventState);
  }
  void _mapEventState(TarefaEvent event, Emitter emit) async {
    List<TarefaModel> tarefas = [];

    emit(TarefaLoadingState());
    if (event is GetTarefas) {
      tarefas = await _repository.getTarefas();
    } else if (event is PostTarefas) {
      tarefas = await _repository.postTarefas(tarefa: event.tarefa);
    } else if (event is DeleteTarefas) {
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }
    emit(TarefaLoadedState(tarefas: tarefas));
  }
}
