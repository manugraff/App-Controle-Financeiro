import 'package:flutter/material.dart';
import 'saving_tips_page.dart';
import 'package:untitled1/add_expense.dart';

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
            title: Text('Dicas de Economia'), // Novo item de menu
            leading: Icon(Icons.lightbulb_outline),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavingTipsPage()), // Navegação para a nova tela
              );
            },
          ),
        ],
      ),
    );
  }
}
