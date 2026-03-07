import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/providers/game_state.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';

Widget barraInformacoes({
  required BuildContext context,
  required double width
}) {
  Jogo? jogo = context.watch<GameState>().jogo;
  String? informacaoJogo = jogo!.informacaoJogo;

  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(8)
    ),
    width: width * (361/393),
    height: width * (50/393),
    child: Center(
      child: Text(informacaoJogo!),
    ),
  );
}