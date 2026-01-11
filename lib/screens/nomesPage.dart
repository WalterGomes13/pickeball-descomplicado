import 'package:flutter/material.dart';
import './common/formSimples.dart';

class nomesPage extends StatelessWidget{
  const nomesPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formSimples(),
          ],
        ),
      ),
    );
  }
}