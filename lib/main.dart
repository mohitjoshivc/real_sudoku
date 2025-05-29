import 'package:flutter/material.dart';
// import 'package:real_sudoku/pages/board/board.dart';
import 'package:real_sudoku/pages/home_page.dart';
// import 'package:real_sudoku/pages/root_page.dart';
import 'package:real_sudoku/pages/signin_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Sudoku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4E71FF)),
        useMaterial3: true,
        scaffoldBackgroundColor: Theme.of(context).secondaryHeaderColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        // '/': (_) => true ? SigninPage() : const RootPage(),
        '/signin': (_) => const SigninPage(),
        // '/board': (_) => const Board(),
      },
    );
  }
}
