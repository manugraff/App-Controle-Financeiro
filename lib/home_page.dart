import 'package:flutter/material.dart';
import 'add_expense.dart';
import 'expense.dart';
import 'expense_details.dart';
import 'saving_tips_page.dart';

class HomePage extends StatefulWidget {
  final List<Expense> expenses;

  HomePage({required this.expenses});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: CustomNavigationDrawer(),
      body: ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          final expense = widget.expenses[index];
          return ListTile(
            title: Text(expense.title),
            subtitle: Text('R\$ ${expense.amount.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${expense.date.day}/${expense.date.month}/${expense.date.year}'),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.expenses.removeAt(index);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz), // Adiciona o ícone de "Mais Detalhes"
                  onPressed: () {
                    _showExpenseDetails(context, expense); // Mostra os detalhes quando o botão é pressionado
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newExpense = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpensePage()),
          );
          if (newExpense != null) {
            setState(() {
              widget.expenses.add(newExpense);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showExpenseDetails(BuildContext context, Expense expense) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExpenseDetailsPage(expense: expense)),
    );
  }
}

class CustomNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Adicionar Despesa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddExpensePage()),
              );
            },
          ),
          ListTile(
            title: Text('Dicas de Economia'),
            leading: Icon(Icons.lightbulb_outline),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavingTipsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
