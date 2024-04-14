// Sealed class representing different types of errors
import 'package:flutter/material.dart';

sealed class AppError {}

class NetworkError extends AppError {
  final String message;

  NetworkError(this.message);
}

class ServerError extends AppError {
  final int statusCode;

  ServerError(this.statusCode);
}

class ClientError extends AppError {
  final int statusCode;

  ClientError(this.statusCode);
}

class GenericError extends AppError {
  final String message;

  GenericError(this.message);
}

class ApiService {
  Future<String> fetchData() async {
    // Simulating an API request that may result in an error
    await Future.delayed(const Duration(seconds: 2));

    // Descomente as linhas abaixo para simular diferentes cenários de erro

    // throw NetworkError('Sem conexão com a Internet');
    // throw ServerError(500);
    // throw ClientError(404);
    // throw GenericError('Algo deu errado');

    return 'Data successfully fetched';
  }
}

// class ApiService {
//   Future<(String?, AppError?)> fetchData() async {
//     // Simulação de uma solicitação de API que pode resultar em um erro
//     await Future.delayed(const Duration(seconds: 2));

//     return (null, NetworkError('No internet connection'));

//     return ('Data successfully fetched', null);
//   }
// }

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error Handling'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: apiService.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                final error = snapshot.error;
                if (error is AppError) {
                  return switch (error) {
                    NetworkError(message: var message) =>
                      Text('Network Error: $message'),
                    ServerError(statusCode: var statusCode) =>
                      Text('Server Error: $statusCode'),
                    ClientError(statusCode: var statusCode) =>
                      Text('Client Error: $statusCode'),
                    GenericError(message: var message) =>
                      Text('Generic Error: $message'),
                  };
                } else {
                  return const Text('Unknown error');
                }
              } else {
                return Text(snapshot.data ?? 'No data available');
              }
            },
          ),
        ),
      ),
    );
  }
}
