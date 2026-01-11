import 'package:flutter/material.dart';

class mainButton extends StatelessWidget{
  const mainButton({super.key, required this.enabled,required this.texto, required this.rota, required this.formFunction});

  final bool enabled;
  final String texto;
  final String rota;
  final VoidCallback? formFunction;

  @override
  Widget build(BuildContext context){
    final VoidCallback? onPressed = enabled ? () => Navigator.pushNamed(context, rota) : null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FilledButton(
        onPressed: () {
          onPressed?.call();
          formFunction?.call();
        },
        child: Text(texto),
      )
    );
  } 
}