import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final bool completed;

  final VoidCallback onDelete;
  final ValueChanged<bool?> onChanged;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.completed,
    required this.onDelete,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: Checkbox(
          value: completed,
          onChanged: onChanged,
        ),

        title: Text(
          title,
          style: TextStyle(
            decoration: completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),

        subtitle: Text(description),

        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: onDelete,
        ),
      ),
    );
  }
}