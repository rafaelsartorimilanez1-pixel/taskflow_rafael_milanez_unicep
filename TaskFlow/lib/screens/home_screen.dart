import 'package:flutter/material.dart';
import '../data/tasks.dart';
import '../widgets/task_card.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard(
            title: tasks[index]["title"] as String,
            description: tasks[index]["description"] as String,
            completed: tasks[index]["completed"] as bool,
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8DB4FF),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddTaskScreen(),
            ),
          );
        },
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