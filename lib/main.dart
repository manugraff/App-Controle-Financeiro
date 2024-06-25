import 'package:flutter/material.dart';
import 'expense.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Expense> expenses = [
    Expense(
      id: 1,
      title: 'Despesa 1',
      amount: 100.0,
      description: 'Descrição da despesa 1',
      date: DateTime.now(),
      location: 'Localização da despesa 1',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Financeiro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.pinkAccent),
        backgroundColor: Colors.white,
      ),
      home: HomePage(expenses: expenses),
    );
  }
}