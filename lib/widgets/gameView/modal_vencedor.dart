import 'package:flutter/material.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';

void mostrarVencedor(BuildContext context, double width, Time timeVencedor){
  showDialog(
    context: context, 
    builder: (context){
      final navigator = Navigator.of(context);
      Future.delayed(const Duration(seconds: 2), (){
        navigator.pop();
      });

      return modalVencedor(context: context, width: width, timeVencedor: timeVencedor);
    }
  );
}

Widget modalVencedor({
  required BuildContext context,
  required double width,
  required Time timeVencedor
}) {
  return Center(
    child: Container(
      width: width * (280/393),
      height: width * (100/393),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Center(
        child: (timeVencedor.isDupla)
         ? Text("Os jogadores ${timeVencedor.jogador1.jogador.nome} e ${timeVencedor.jogador2!.jogador.nome} venceram!")
         : Text("O jogador ${timeVencedor.jogador1.jogador.nome} venceu!")
      ),
    ),
  );
}