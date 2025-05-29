import 'package:flutter/material.dart';
import 'package:real_sudoku/pages/board/sudoku_cell.dart';

class SudokuBoard extends StatefulWidget {
  final List<List<int>> sudokuGrid;
  final Map<String, int?> selectedCell;
  final Function(int row, int col) onCellPress;
  const SudokuBoard(
      {super.key,
      required this.sudokuGrid,
      required this.selectedCell,
      required this.onCellPress});

  @override
  State<SudokuBoard> createState() => _SudokuBoardState();
}

class _SudokuBoardState extends State<SudokuBoard> {
  late List<List<int>> _grid;

  @override
  void initState() {
    super.initState();
    _grid = widget.sudokuGrid;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.06,
        horizontal: 8.0,
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9,
              childAspectRatio: 1.0,
            ),
            itemCount: 81,
            itemBuilder: (context, index) {
              final row = index ~/ 9;
              final col = index % 9;
              return SudokuCell(
                value: _grid[row][col],
                row: row,
                col: col,
                isPreFilled: _grid[row][col] != 0,
                isSelected: widget.selectedCell['row'] == row &&
                    widget.selectedCell['col'] == col,
                onPress: () => widget.onCellPress(row, col),
              );
            },
          ),
        ),
      ),
    );
  }
}
