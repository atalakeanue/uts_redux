import '/models/todo.dart';
import '/actions/todo_actions.dart';

// Reducer khusus untuk operasi-operasi todo
List<Todo> todoReducer(List<Todo> state, dynamic action) {
  if (action is AddTodoAction) {
    // Menambahkan todo baru ke daftar
    return [...state, Todo(title: action.title)];
  } else if (action is RemoveTodoAction) {
    // Menghapus todo dari daftar berdasarkan indeks
    return List.from(state)..removeAt(action.index);
  } else if (action is ToggleTodoAction) {
    // Mengubah status selesai atau belum todo berdasarkan indeks
    return state.map((todo) {
      if (state.indexOf(todo) == action.index) {
        return Todo(title: todo.title, isDone: !todo.isDone);
      }
      return todo;
    }).toList();
  }
  // Jika bukan aksi yang dikenali, kembalikan state tanpa perubahan
  return state;
}
