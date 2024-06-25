import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'expense.dart';

class FilterExpensesPage extends StatefulWidget {
  final List<Expense> expenses;

  FilterExpensesPage({required this.expenses});

  @override
  _FilterExpensesPageState createState() => _FilterExpensesPageState();
}

class _FilterExpensesPageState extends State<FilterExpensesPage> {
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now().subtract(Duration(days: 30));
    _endDate = DateTime.now();
  }

  void _applyFilter() {
    List<Expense> filteredExpenses = widget.expenses.where((expense) {
      return expense.date.isAfter(_startDate.subtract(Duration(days: 1))) &&
          expense.date.isBefore(_endDate.add(Duration(days: 1)));
    }).toList();


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FilteredExpensesScreen(expenses: filteredExpenses),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Despesas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Selecione o intervalo de datas para filtrar as despesas:'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Data Inicial: ${DateFormat('dd/MM/yyyy').format(_startDate)}'),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: DateTime(2015),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _startDate = picked;
                      });
                    }
                  },
                  child: Text('Selecionar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Data Final: ${DateFormat('dd/MM/yyyy').format(_endDate)}'),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _endDate,
                      firstDate: DateTime(2015),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        _endDate = picked;
                      });
                    }
                  },
                  child: Text('Selecionar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _applyFilter,
              child: Text('Aplicar Filtro'),
            ),
          ],
        ),
      ),
    );
  }
}

class FilteredExpensesScreen extends StatelessWidget {
  final List<Expense> expenses;

  FilteredExpensesScreen({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Filtradas'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(expenses[index].title),
            subtitle: Text(
              'R\$ ${expenses[index].amount.toStringAsFixed(2)} - ${DateFormat('dd/MM/yyyy').format(expenses[index].date)}',
            ),
          );
        },
      ),
    );
  }
}
