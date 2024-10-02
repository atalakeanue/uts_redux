import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '/models/app_state.dart';
import '/actions/todo_actions.dart';
import '/models/todo.dart';

class TodoPage extends StatelessWidget {
  // Controller untuk input teks
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux To-Do List'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField untuk menambahkan tugas baru
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                labelStyle: TextStyle(color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.deepPurple.shade50,
                prefixIcon: Icon(Icons.task, color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Daftar todo
            Expanded(
              // Menggunakan StoreConnector untuk menghubungkan state Redux dengan UI
              child: StoreConnector<AppState, List<Todo>>(
                // Mengambil daftar todo dari state
                converter: (store) => store.state.todos,
                builder: (context, todos) {
                  return todos.isEmpty
                      ? // Tampilkan pesan jika tidak ada tugas
                      Center(
                          child: Text(
                            'No tasks yet, add some!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        )
                      : // Tampilkan daftar tugas
                      ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 4,
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading: Checkbox(
                                  value: todos[index].isDone,
                                  onChanged: (bool? value) {
                                    // Dispatch aksi untuk mengubah status todo
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(ToggleTodoAction(index));
                                  },
                                ),
                                title: Text(
                                  todos[index].title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    decoration: todos[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () =>
                                      // Dispatch aksi untuk menghapus todo
                                      StoreProvider.of<AppState>(context)
                                          .dispatch(RemoveTodoAction(index)),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
      // Tombol untuk menambahkan tugas baru
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          if (taskController.text.isNotEmpty) {
            // Dispatch aksi untuk menambahkan todo baru
            StoreProvider.of<AppState>(context)
                .dispatch(AddTodoAction(taskController.text));
            taskController.clear();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
