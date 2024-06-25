import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'expense.dart';
import 'expense_details.dart';
import 'add_expense.dart';
import 'database.dart';
import 'custom_navigation_drawer.dart';

class HomePage extends StatefulWidget {
  final List<Expense> expenses;

  HomePage({required this.expenses});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _refreshExpenseList();
  }

  void _refreshExpenseList() async {
    List<Expense> xList = await _databaseHelper.getExpenses();
    setState(() {
      widget.expenses.clear();
      widget.expenses.addAll(xList);
    });
  }

  void _addNewExpense() async {
    final newExpense = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddExpensePage()),
    );
    if (newExpense != null) {
      _refreshExpenseList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Despesas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addNewExpense,
          ),
        ],
      ),
      drawer: CustomNavigationDrawer(expenses: widget.expenses),
      body: widget.expenses.isEmpty
          ? Center(
        child: Text('Nenhuma despesa encontrada.'),
      )
          : ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.expenses[index].title),
            subtitle: Text(
                'R\$ ${widget.expenses[index].amount.toStringAsFixed(2)} - ${DateFormat('dd/MM/yyyy').format(widget.expenses[index].date)}'),
            onTap: () async {
              final editedExpense = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ExpenseDetailsPage(expense: widget.expenses[index]),
                ),
              );
              if (editedExpense != null) {
                setState(() {
                  widget.expenses[index] = editedExpense;
                });
              }
            },
          );
        },
      ),
    );
  }
}
