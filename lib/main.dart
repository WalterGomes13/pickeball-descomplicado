import 'package:flutter/material.dart';
import 'package:pickleball_descomp_flutter/screens/categoryPage.dart';
import 'package:pickleball_descomp_flutter/screens/nomesPage.dart';
import 'package:provider/provider.dart';
import './screens/enterPage.dart';
import './screens/gameModePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => categoryState()), // categoria escolhida
        ChangeNotifierProvider(create: (_) => gameState()) // modo de jogo escolhido
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
          onPrimary: Colors.white
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            fontSize: 16,
            fontFamily: 'Afacad'
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
        '/modoJogo':(_) => const gameModePage(),
        '/nomes':(_) => const nomesPage()
      },
    );
  }
}

class AppColors {
  static const background = Color(0xFF7BBBD9);
  static const primary = Color(0xFF31609D);
}