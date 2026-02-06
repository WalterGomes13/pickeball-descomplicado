import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/enter_page.dart';
import 'screens/category_page.dart';
import 'screens/game_mode_page.dart';
import 'screens/nomes_page.dart';
import 'screens/game_page.dart';

import 'providers/category_state.dart';
import 'providers/game_mode_state.dart';
import 'providers/nome_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryState()), // categoria escolhida
        ChangeNotifierProvider(create: (_) => GameModeState()), // modo de jogo escolhido
        ChangeNotifierProvider(create: (_) => NomeState()), //formulario simples
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          surface: AppColors.background,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          onSecondary: AppColors.onSecondary
        ),
        textTheme: TextTheme(
          bodySmall: const TextStyle(
            fontSize: 16,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.normal
          ),
          bodyMedium: const TextStyle(
            fontSize: 20,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w500
          )
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 24,
              fontFamily: 'Afacad',
              fontWeight: FontWeight.bold,
            ),
            minimumSize: const Size(235, 37),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const enterPage(),
        '/categoria':(_) => const categoryPage(),
        '/modoJogo':(_) => const GameModePage(),
        '/nomes':(_) => const NomesPage(),
        '/jogo':(_) => const GamePage()
      },
    );
  }
}

class AppColors {
  static const background = Color(0xFF7BBBD9);
  static const primary = Color(0xFF31609D);
  static const onPrimary = Colors.white;
  static const onSecondary = Color(0xFF999999);
}