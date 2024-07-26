import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_floater/stores/todo_store.dart';

class InclusaoPage extends StatefulWidget {
  const InclusaoPage({super.key});

  @override
  State<InclusaoPage> createState() => _InclusaoPageState();
}

class _InclusaoPageState extends State<InclusaoPage> {
  final _formKey = GlobalKey<FormState>();
  final todoStore = Modular.get<TodoStore>();
  final _tituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inclusão de TODO')),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _tituloController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira um título';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      todoStore.add(_tituloController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('TODO incluído com sucesso!')),
                      );
                      Modular.to.pop();
                    }
                  },
                  child: const Text('Salvar TODO'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
