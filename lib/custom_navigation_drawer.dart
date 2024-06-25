import 'package:flutter/material.dart';
import 'home_page.dart';
import 'add_expense.dart';
import 'filter_expenses_page.dart';
import 'saving_tips_page.dart';
import 'expense.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final List<Expense> expenses;

  CustomNavigationDrawer({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
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
            title: Text('Página Inicial'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(expenses: expenses)),
              );
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
            title: Text('Filtrar Despesas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterExpensesPage(expenses: expenses)),
              );
            },
          ),
          ListTile(
            title: Text('Dicas de Economia'),
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
