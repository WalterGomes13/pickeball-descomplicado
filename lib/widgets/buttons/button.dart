import 'package:flutter/material.dart';

class mainButton extends StatelessWidget{
  const mainButton({super.key, 
    required this.texto, 
    required this.formFunction
  });

  final String texto;
  final VoidCallback? formFunction;

  @override
  Widget build(BuildContext context){
    //final VoidCallback? onPressed = enabled ? () => Navigator.pushNamed(context, rota) : null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FilledButton(
        onPressed: () {
          formFunction?.call();
        },
        child: Text(texto),
      )
    );
  } 
}