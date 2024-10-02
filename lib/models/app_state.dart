import '/models/todo.dart';

class AppState {
  final List<Todo> todos;

// Model yang menyimpan state aplikasi, yaitu daftar todo.
  AppState({required this.todos});

// State awal yang diinisialisasi dengan daftar todo kosong.
  AppState.initialState() : todos = [];
}
