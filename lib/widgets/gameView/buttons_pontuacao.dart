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
    height: width * (120/361),//testar dividido 393
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          FilledButton(
            onPressed: () {
              context.read<GameState>().pontuar(times[0], times[1]);
            }, 
            child: Text((times![0].isDupla)? 'Pontuar Dupla 1' : 'Pontuar Jogador 1')
          ),
          FilledButton(
            onPressed: () {
              context.read<GameState>().pontuar(times[1], times[0]);
            }, 
            child: Text((times[1].isDupla)? 'Pontuar Dupla 2' : 'Pontuar Jogador 2')
          )
        ],
      ),
    ),
  );
}