import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/home/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/home/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme(selectColor: 8).getThema(),
      debugShowCheckedModeBanner: false,
      home:  const HomeScreen(),
      routes: {
        '/buttons':(context) => const ButtonsScreen(),
        '/cards':(context) => const CardsScreen(),
      },
    );
  }
}
