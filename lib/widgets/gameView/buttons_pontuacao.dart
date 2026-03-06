import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';

import 'package:pickleball_descomp_flutter/providers/game_state.dart';

Widget buttonsPontuacao({
  required BuildContext context,
  required double width
}) {
  final List<Time>? times = context.read<GameState>().jogo?.times;

  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(8)
    ),
    width: width * (361/393),
    height: width * (120/393),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: Size(width * (267/393), width * (48/393)),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              foregroundColor: Color(0xFF1900FF),
              side: BorderSide(
                color: Color(0xFF1900FF)
              )
            ),
            onPressed: () {
              context.read<GameState>().pontuar(times[0], times[1]);
            }, 
            child: Text((times![0].isDupla)? 'Pontuar ${times[0].jogador1.jogador.nome} / ${times[0].jogador2?.jogador.nome}' : 'Pontuar ${times[0].jogador1.jogador.nome}')
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: Size(width * (267/393), width * (48/393)),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              foregroundColor: Color(0xFFFF0004),
              side: BorderSide(
                color: Color(0xFFFF0004)
              )
            ),
            onPressed: () {
              context.read<GameState>().pontuar(times[1], times[0]);
            }, 
            child: Text((times[1].isDupla)? 'Pontuar ${times[1].jogador1.jogador.nome} / ${times[1].jogador2?.jogador.nome}' : 'Pontuar ${times[1].jogador1.jogador.nome}')
          )
        ],
      ),
    ),
  );
}