class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  get date => null;

  static List<ToDo> todoList() {
    return [];
  }
}
