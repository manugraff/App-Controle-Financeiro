import 'package:flutter/material.dart';
import 'add_expense.dart';
import 'home_page.dart';
import 'expense.dart';

void main() {

  List<Expense> expenses = [];

  runApp(MyApp(expenses: expenses));
}

class MyApp extends StatelessWidget {
  final List<Expense> expenses;

  MyApp({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Financeiro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.pinkAccent),
        backgroundColor: Colors.white,
      ),
      home: HomePage(expenses: expenses),
    );
  }
}
