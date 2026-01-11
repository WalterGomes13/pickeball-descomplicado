import 'package:flutter/material.dart';
import 'input.dart';
import 'radio.dart';

class formSimples extends StatelessWidget{
  const formSimples({super.key});

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        final width = constraints.maxWidth.clamp(0, 636) * (300/393);

        return SizedBox(
          width: width,
          height: width * (381/300),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 46),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jogador 1', style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 5),
                input(texto: 'Nome'),
                SizedBox(height: 10),
                input(texto: 'Sobrenome'),
                escolhaGenero(),
                SizedBox(height: 15),
                Text('Jogador 2', style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 5),
                input(texto: 'Nome'),
                SizedBox(height: 10),
                input(texto: 'Sobrenome'),
                escolhaGenero()
              ],
            ),
          ),
        );
      }
    );
  }
}