import 'package:bloc_pattern_exemple/model/tarefa_model.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_bloc.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_event.dart';
import 'package:bloc_pattern_exemple/tarefa_blocs/tarefa_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _tarefabloc.add(
        GetTarefas()); //chamando novo event para nosso bloc chamado getTarefa
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My APP Bloc'),
      ),
      body: BlocBuilder<TarefaBloc, TarefaState>(
        //ouvindo emissoes de estado
        bloc: _tarefabloc, // qual a saida de dados que ele vai ouvir
        builder: (context, state) {
          if (state is TarefaLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TarefaLoadedState) {
            final list = state.tarefas;
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
                      _tarefabloc.add(
                        DeleteTarefas(
                          tarefa: list[index],
                        ),
                      );
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
          _tarefabloc.add(
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
    _tarefabloc.close(); //liverar recursos de memória
    super.dispose();
  }
}
