import 'package:flutter/material.dart';

class MessageRow extends StatelessWidget {
  const MessageRow({
    super.key,
    required this.imagePath,
    required this.message,
  });

  final String imagePath, message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26, width: 2),
            ),
            padding: const EdgeInsets.all(16),
            // child: const Text('What a trip! Thanks for all the memories! Whats next?'),
            child: Text(message),
          ),
        )
      ],
    );
  }
}
