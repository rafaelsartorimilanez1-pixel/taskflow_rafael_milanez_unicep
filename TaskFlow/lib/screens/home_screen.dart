import 'package:flutter/material.dart';
import '../data/tasks.dart';
import '../widgets/task_card.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> addTask() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddTaskScreen(),
      ),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final pendingTasks =
    tasks.where((task) => task["completed"] == false).toList();

    final completedTasks =
    tasks.where((task) => task["completed"] == true).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF171731),

      appBar: AppBar(
        backgroundColor: const Color(0xFF98958F),
        centerTitle: true,
        title: const Text(
          "TaskFlow",
          style: TextStyle(
            color: Color(0xFFDCE1FF),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        children: [

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Pendentes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ...pendingTasks.map((task) {
            return TaskCard(
              title: task["title"] as String,
              description: task["description"] as String,
              completed: task["completed"] as bool,

              onChanged: (value) {
                setState(() {
                  task["completed"] = value!;
                });
              },

              onDelete: () {
                setState(() {
                  tasks.remove(task);
                });
              },
            );
          }),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Concluídas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ...completedTasks.map((task) {
            return TaskCard(
              title: task["title"] as String,
              description: task["description"] as String,
              completed: task["completed"] as bool,

              onChanged: (value) {
                setState(() {
                  task["completed"] = value!;
                });
              },

              onDelete: () {
                setState(() {
                  tasks.remove(task);
                });
              },
            );
          }),

          const SizedBox(height: 90),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8DB4FF),
        onPressed: addTask,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}