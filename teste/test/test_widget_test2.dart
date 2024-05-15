// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste/src/test_widget.dart';

void main() {

  Future<void> _createWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Teste',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TestWidget(),
      ),
    );
    
    await tester.pump();
  }
  
  testWidgets('Test Widget', (WidgetTester tester) async {
    await _createWidget(tester);

    // Buscar por Texto
    expect(find.text('0'), findsOneWidget);

    // Receberá um widget encontrado pelo localizador
    await tester.tap(find.byType(FloatingActionButton));

    // Recria a tela
    await tester.pump();

    // Esperar que seja encontrada a string que contém o número 1 e não mais o 0
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    
  });

  
}
