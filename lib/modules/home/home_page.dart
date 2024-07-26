import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_floater/stores/todo_store.dart';

var todoStore = TodoStore();

class HomePage extends StatelessWidget {
  final todoStore = Modular.get<TodoStore>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Observer(
            builder: (context) => Column(
                  children: todoStore.todos
                      .map((todo) => ElevatedButton(
                            onPressed: () =>
                                Modular.to.pushNamed('/detalhe/${todo.id}'),
                            child: Text(todo.titulo),
                          ))
                      .toList(),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('/inclusao'),
        child: Icon(Icons.add),
      ),
    );
  }
}
