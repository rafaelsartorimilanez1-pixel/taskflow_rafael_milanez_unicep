import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final bool completed;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 12,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF343650),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: completed
              ? const Color(0xFFA8E6A3)
              : Colors.white,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                color: Colors.white,
                child: completed
                    ? const Icon(Icons.close)
                    : null,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: completed
                        ? const Color(0xFFA8E6A3)
                        : const Color(0xFFDCE1FF),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: completed
                  ? const Color(0xFFA8E6A3)
                  : const Color(0xFFDCE1FF),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}