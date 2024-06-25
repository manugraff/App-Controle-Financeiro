import 'package:flutter/material.dart';

class Expense {
  final int id;
  final String title;
  final double amount;
  final String description;
  final DateTime date;
  final String location;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.description,
    required this.date,
    required this.location,
  });

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      location: map['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'description': description,
      'date': date.toIso8601String(),
      'location': location,
    };
  }
}
