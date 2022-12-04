import 'package:flutter/material.dart';

class SelectedUserCard extends StatelessWidget {
  const SelectedUserCard({
    Key? key,
    required this.title,
    this.isGreenBackground = false,
    required this.id,
    required this.userId,
    required this.completed,
  }) : super(key: key);

  final String title;
  final bool isGreenBackground;
  final int id;
  final int userId;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        child: Container(
          height: 90,
          color: isGreenBackground ? Colors.green : null,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('userId: ${userId.toString()}'),
                    const SizedBox(
                      height: 4,
                    ),
                    Text('id: ${id.toString()}'),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'title: $title',
                      style: const TextStyle(fontSize: 10),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text('Completed: ${completed.toString()}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
