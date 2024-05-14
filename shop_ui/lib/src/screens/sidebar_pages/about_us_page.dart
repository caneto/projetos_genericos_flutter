import 'package:flutter/material.dart';

class AbouUsPage extends StatelessWidget {
  const AbouUsPage({super.key, this.backButton});
  final Widget? backButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton,
      ),
      body: const Center(
        child: Text('About Us Page'),
      ),
    );
  }
}
