import 'package:flutter/material.dart';
import 'package:pickleball_descomp_flutter/models/jogador.dart';

class escolhaGenero extends StatelessWidget{
  const escolhaGenero({super.key, required this.GeneroSelecionado, required this.onChanged});

  final Genero? GeneroSelecionado;
  final ValueChanged<Genero?> onChanged;

  @override
  Widget build(BuildContext context){
    return RadioGroup<Genero>(
      groupValue: GeneroSelecionado,
      onChanged: onChanged,
      child: Row(
        children:  [
          Expanded(
            child: ListTile(
              title: Text('Homem', style: Theme.of(context).textTheme.bodySmall,),
              leading: Radio<Genero>(value: Genero.Homem, activeColor: Theme.of(context).colorScheme.primary,),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('Mulher', style: Theme.of(context).textTheme.bodySmall,),
              leading: Radio<Genero>(value: Genero.Mulher, activeColor: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}