import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'expense.dart';

class ExpenseDetailsPage extends StatelessWidget {
  final Expense expense;

  ExpenseDetailsPage({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Despesa'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EditExpensePage(expense: expense),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              expense.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'R\$ ${expense.amount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(expense.description),
            SizedBox(height: 10),
            Text('Data: ${DateFormat('dd/MM/yyyy').format(expense.date)}'),
            SizedBox(height: 10),
            Text('Localização: ${expense.location}'),
          ],
        ),
      ),
    );
  }
}

class EditExpensePage extends StatelessWidget {
  final Expense expense;

  EditExpensePage({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Despesa'),
      ),
      body: Center(
        child: Text('Formulário de Edição da Despesa'),
      ),
    );
  }
}
