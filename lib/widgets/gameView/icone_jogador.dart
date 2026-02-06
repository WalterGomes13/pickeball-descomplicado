import 'package:flutter/material.dart';

import 'package:pickleball_descomp_flutter/models/jogador.dart';

Widget iconeJogador({
  required BuildContext context,
  required Jogador? jogador,
  required Color cor
}) {
  
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ClipOval(
        child: Container(
          width: 63,
          height: 63,
          color: cor,
          child: Image(
            image: AssetImage('assets/icone_jogador.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
      Text('${jogador?.nome?[0]}. ${jogador?.sobrenome}', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15))
    ],
  );
}