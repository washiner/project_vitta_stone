import 'package:bloc_pattern_exemple/model/tarefa_model.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_bloc.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_event.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_state.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  late TarefaBloc _tarefabloc;
  @override
  void initState() {
    super.initState();
    _tarefabloc = TarefaBloc();
    _tarefabloc.inputTarefa.add(
        GetTarefas()); //chamando novo event para nosso bloc chamado getTarefa
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My APP Bloc'),
      ),
      body: StreamBuilder<TarefaState>(
        //ouvindo emissoes de estado
        stream:
            _tarefabloc.outputTarefa, // qual a saida de dados que ele vai ouvir
        builder: (context, state) {
          if (state.data is TarefaLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.data is TarefaLoadedState) {
            final list = state.data?.tarefas ?? [];
            return ListView.separated(
              itemCount: list.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Center(
                      child: Text(
                        list[index].nome[0],
                      ),
                    ),
                  ),
                  title: Text(list[index].nome),
                  trailing: IconButton(
                    onPressed: () {
                      _tarefabloc.inputTarefa
                          .add(DeleteTarefas(tarefa: list[index]));
                    },
                    icon: const Icon(Icons.delete_rounded),
                    color: Colors.red,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tarefabloc.inputTarefa.add(
            PostTarefas(
              tarefa: TarefaModel(nome: "Levar Shiro no Petshop"),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _tarefabloc.inputTarefa.close();  //liverar recursos de memória
    super.dispose();
  }
}
