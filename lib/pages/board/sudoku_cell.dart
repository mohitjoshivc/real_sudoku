import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  final int value;
  final int row;
  final int col;
  final bool isSelected;
  final bool isPreFilled;
  final Function() onPress;

  const SudokuCell({
    super.key,
    required this.value,
    required this.row,
    required this.col,
    required this.isSelected,
    required this.isPreFilled,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final bool isThickRight = (col + 1) % 3 == 0 && col != 8;
    final bool isThickBottom = (row + 1) % 3 == 0 && row != 8;

    return GestureDetector(
      onTap: () {
        if (isPreFilled) return;
        onPress();
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
          border: Border(
            right: BorderSide(
              color: isThickRight ? Colors.black : Colors.grey.shade400,
              width: isThickRight ? 2.0 : 0.5,
            ),
            bottom: BorderSide(
              color: isThickBottom ? Colors.black : Colors.grey.shade400,
              width: isThickBottom ? 2.0 : 0.5,
            ),
            top: BorderSide(color: Colors.grey.shade400, width: 0.5),
            left: BorderSide(color: Colors.grey.shade400, width: 0.5),
          ),
        ),
        alignment: Alignment.center,
        child: value == 0
            ? null
            : Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
      ),
    );
  }
}
