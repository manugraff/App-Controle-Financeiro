import 'package:flutter/material.dart';
import 'expense.dart';

class ExpenseDetailsPage extends StatelessWidget {
  final Expense expense;

  ExpenseDetailsPage({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Despesa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título: ${expense.title}'),
            SizedBox(height: 10),
            Text('Valor: R\$ ${expense.amount.toStringAsFixed(2)}'),
            SizedBox(height: 10),
            Text('Descrição: ${expense.description}'),
            SizedBox(height: 10),
            Text('Data: ${expense.date.day}/${expense.date.month}/${expense.date.year}'),
          ],
        ),
      ),
    );
  }
}
