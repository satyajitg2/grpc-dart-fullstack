import 'package:protos/protos.dart';

class TodoService extends TodoServiceBase {
  @override
  Future<Todo> getTodo(ServiceCall call, GetTodoByIdRequest request) async {
    final id = request.id;
    final todo = Todo(id: id, title: 'title $id', completed: false);

    return todo;
  }
}
