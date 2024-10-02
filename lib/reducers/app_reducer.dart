import '/models/app_state.dart';
import '/reducers/todo_reducer.dart';

// Reducer utama yang menggabungkan semua reducer
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    // Memanggil todoReducer untuk memproses perubahan pada daftar todo
    todos: todoReducer(state.todos, action),
  );
}
