import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _HomeState();
}

class _HomeState extends State<Calendar> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 239, 221),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Constants.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Constants.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: Center(
                          child: Text(
                            'Jadwal Tanam',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      if (_foundToDo.isEmpty)
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 50,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  size: 50.0,
                                  color: Constants.primaryColor,
                                ),
                              ),
                            ),
                            Text('Belum ada jadwal'),
                          ],
                        ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                            hintText: 'Buat jadwal baru',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Constants.primaryColor,
                        minimumSize: Size(60, 60),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Cari jadwal...',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text(
            'Kalender Tanam',
            style: TextStyle(
              color: tdBlack,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
