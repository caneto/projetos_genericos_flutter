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
    expect(find.text('Teste Widget'), findsOneWidget);
    
    // Buscar por Key do Widget
    expect(find.byKey(TestWidget.buttonKey), findsOneWidget);

    // Buscar Widget por Tipo
    expect(find.byType(FloatingActionButton), findsOneWidget);
    
  });

  
}
