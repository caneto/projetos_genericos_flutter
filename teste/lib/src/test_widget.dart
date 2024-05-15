import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  static Key buttonKey = const Key('buttonKey');

  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Widget'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              key: buttonKey,
              onPressed: () {},
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Button',
        child: const Icon(Icons.add),
      ),
    );
  }
}
