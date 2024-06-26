import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wander_animation/pages/home_page.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails errorDatails) => CustomError(errorDatails: errorDatails);

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stack) {
    log('Erro não tratado',error: error, stackTrace: stack);
    throw error;
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}


class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDatails;

  const CustomError({
    super.key,
    required this.errorDatails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(.3),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Error Occurred!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                kDebugMode
                    ? 'Oops... something went wrong'
                    : errorDatails.exception.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
