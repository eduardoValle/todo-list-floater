import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_floater/stores/todo_store.dart';

class DetalhePage extends StatelessWidget {
  final int id;
  final todoStore = Modular.get<TodoStore>();

  DetalhePage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var todo = todoStore.getByID(id);

    return Scaffold(
      appBar: AppBar(title: Text('Detalhe')),
      body: Center(
        child: Column(
          children: [
            Text(todo.titulo),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Modular.to.pop(),
                  child: Text('Voltar'),
                ),
                IconButton(
                  onPressed: () {
                    todoStore.remove(id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('TODO removido com sucesso!')),
                    );
                    Modular.to.pop();
                  },
                  icon: Icon(Icons.close, color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
