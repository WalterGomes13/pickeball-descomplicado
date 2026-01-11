import 'package:flutter/material.dart';

enum genero {Homem, Mulher}

class escolhaGenero extends StatefulWidget{
  const escolhaGenero({super.key});

  State<escolhaGenero> createState() => _escolhaGeneroState();
}

class _escolhaGeneroState extends State<escolhaGenero> {
  genero? _genero = genero.Homem;

  @override
  Widget build(BuildContext context){
    return RadioGroup<genero>(
      groupValue: _genero,
      onChanged: (genero? value){
        setState(() {
          _genero = value;
        });
      },
      child: Row(
        children:  [
          Expanded(
            child: ListTile(
              title: Text('Homem', style: Theme.of(context).textTheme.bodyMedium,),
              leading: Radio<genero>(value: genero.Homem, activeColor: Theme.of(context).colorScheme.primary,),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('Mulher', style: Theme.of(context).textTheme.bodyMedium,),
              leading: Radio<genero>(value: genero.Mulher, activeColor: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}