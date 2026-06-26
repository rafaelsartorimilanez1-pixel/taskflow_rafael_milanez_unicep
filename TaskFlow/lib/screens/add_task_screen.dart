import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void saveTask() {
    if (titleController.text.trim().isEmpty) return;

    Navigator.pop(context, {
      "title": titleController.text,
      "description": descriptionController.text,
      "completed": false,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171731),

      appBar: AppBar(
        backgroundColor: const Color(0xFF98958F),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFDCE1FF),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "TaskFlow",
          style: TextStyle(
            color: Color(0xFFDCE1FF),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color(0xFF343650),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Adicionar tarefa",
                  style: TextStyle(
                    color: Color(0xFFDCE1FF),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 50),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Título",
                    style: TextStyle(
                      color: Color(0xFFDCE1FF),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Digite o título da tarefa",
                    filled: true,
                    fillColor: const Color(0xFF98958F),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      color: Color(0xFFDCE1FF),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: descriptionController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: "Digite a descrição da tarefa",
                    filled: true,
                    fillColor: const Color(0xFF98958F),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                FloatingActionButton(
                  backgroundColor: const Color(0xFF8DB4FF),
                  onPressed: saveTask,
                  child: const Icon(Icons.check),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}