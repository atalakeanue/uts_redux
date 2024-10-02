// Mendefinisikan aksi-aksi yang dapat dilakukan pada todo list

// Aksi untuk menambah item todo dengan menerima judul dari todo sebagai parameter.
class AddTodoAction {
  final String title;
  AddTodoAction(this.title);
}

// Aksi untuk menghapus item todo berdasarkan index dari daftar todo.
class RemoveTodoAction {
  final int index;
  RemoveTodoAction(this.index);
}

// Aksi untuk mengubah status todo (selesai atau belum) berdasarkan index dari daftar todo.
class ToggleTodoAction {
  final int index;
  ToggleTodoAction(this.index);
}
