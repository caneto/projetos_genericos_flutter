import 'package:flutter/material.dart';
import 'package:shopping/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
