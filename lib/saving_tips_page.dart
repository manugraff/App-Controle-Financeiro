import 'package:flutter/material.dart';

class SavingTipsPage extends StatelessWidget {
  final List<String> tips = [
    "Faça uma lista de compras e siga-a rigorosamente.",
    "Compare preços antes de comprar.",
    "Evite fazer compras por impulso.",
    "Reduza o consumo de energia desligando luzes e aparelhos quando não estiverem em uso.",
    "Prepare refeições em casa em vez de comer fora.",
    "Use cupons e aproveite ofertas e promoções.",
    "Evite pagar juros, pague suas contas em dia.",
    "Corte gastos desnecessários.",
    "Reutilize itens sempre que possível.",
    "Planeje suas compras com antecedência.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dicas de Economia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tips.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline),
                title: Text(
                  tips[index],
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
