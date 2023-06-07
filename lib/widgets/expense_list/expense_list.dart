import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenseList, required this.onRemoveExpense});
  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: ((context, index) => Dismissible(
          key: ValueKey(expenseList[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenseList[index]);
          },
          background: Container(
            color: const Color.fromARGB(255, 206, 150, 241),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: ExpenseItem(expense: expenseList[index]))),
    );
  }
}
