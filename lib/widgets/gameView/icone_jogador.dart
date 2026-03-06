import 'package:flutter/material.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';

Widget iconeJogador({
  required BuildContext context,
  required JogadorEmJogo? jogadorEmJogo,
  required Color cor
}) {
  
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 31.5,
        backgroundColor: cor,
        child: Image.asset(
          'assets/icone_jogador.png',
          width: 57,
          height: 57,
        )
      ),
      if (jogadorEmJogo?.getEstadoJogador == EstadoJogador.sacador) 
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/raquete.png',
              width: 18,
              height: 20,
            ),
            Text('${jogadorEmJogo?.jogador.nome?[0]}. ${jogadorEmJogo?.jogador.sobrenome}', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, color: Theme.of(context).colorScheme.onPrimary))
          ],
        )
      else
        Text('${jogadorEmJogo?.jogador.nome?[0]}. ${jogadorEmJogo?.jogador.sobrenome}', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, color: Theme.of(context).colorScheme.onPrimary))
    ],
  );
}