import 'package:mobx/mobx.dart';
import 'package:teste_floater/core/models/todo.dart';

// Include generated file
part 'todo_store.g.dart';

// This is the class used by rest of your codebase
class TodoStore = _TodoStore with _$TodoStore;

// The store-class
abstract class _TodoStore with Store {
  var _nextID = 3;

  @observable
  var todos = ObservableList<Todo>.of([
    const Todo(id: 1, titulo: 'titulo'),
    const Todo(id: 2, titulo: 'titulo 2')
  ]);

  @action
  void add(String titulo) {
    todos.add(Todo(id: _nextID, titulo: titulo));
    _nextID++;
  }

  @action
  void remove(int id) {
    todos.removeWhere((todo) => todo.id == id);
  }

  @action
  Todo getByID(int id) {
    return todos.firstWhere((todo) => todo.id == id);
  }
}
