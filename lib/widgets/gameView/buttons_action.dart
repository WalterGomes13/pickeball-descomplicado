import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/providers/game_state.dart';

Widget buttonsAction({
  required BuildContext context,
  required double width
}) {
  List<Jogada> jogadas = context.watch<GameState>().jogadas;

  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 6),
      FilledButton(
        onPressed:(jogadas.length > 1)
          ?(){context.read<GameState>().desfazer();}
          :(){}, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("DESFAZER"),
            Icon(Icons.replay)
          ],
        )
      ),
      SizedBox(height: 9),
      FilledButton(
        onPressed: (){
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("NOVO JOGO"),
            Icon(Icons.add)
          ],
        )
      ),
      SizedBox(height: 72)
    ],
  );
}