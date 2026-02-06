import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/widgets/gameView/icone_jogador.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';

import 'package:pickleball_descomp_flutter/providers/game_state.dart';


Widget quadra({
  required BuildContext context,
  required double width
}) {
  final List<Time>? times = context.watch<GameState>().jogo?.times;

  double? posicaoVertical(TimePosicionado timePosicionado, int index){
    double? valorPosicao;
    LadoQuadraVertical? ladoQuadraVertical = timePosicionado.getLadoQuadraVertical;
    EstadoJogador? estadoJogador = (index == 1)
      ? timePosicionado.time?.jogador1.estadoJogador
      : timePosicionado.time?.jogador2?.estadoJogador;
    
    if (ladoQuadraVertical == LadoQuadraVertical.superior){
      valorPosicao = (estadoJogador == EstadoJogador.parceiroRecebedor) 
        ? 480
        : 322;
    } else if (ladoQuadraVertical == LadoQuadraVertical.inferior){
      valorPosicao = (estadoJogador == EstadoJogador.parceiroRecebedor)
        ? 870
        : 1004;
    }

    return valorPosicao;
  }


  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(8)
    ),
    width: width * (361/393),
    height: width * (874/361), //testar dividido por 393
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Container(width: 20,height: 20, decoration: BoxDecoration(color: Color(0xFF1900FF))),
            SizedBox(width: 7),
            Text((times![0].isDupla)?'Dupla 1': 'Jogador 1'),
          ],
        ),
        SizedBox(
          width: width * (361/393),
          height: width * (793.56/361),
          child: Stack(
            children: [
              Image(image: AssetImage('assets/Quadra.png'), fit: BoxFit.fitHeight,),
              if (!times[0].isDupla)
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: times[0].jogador1.getLadoQuadra?.axisX,
                  top: posicaoVertical(context.read<GameState>().timesPosicionados![0], 1), 
                  child: iconeJogador(context: context, jogador: times[0].jogador1.jogador, cor: Color(0xFF1900FF)),
                )
              else
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: times[0].jogador1.getLadoQuadra?.axisX,
                  top: posicaoVertical(context.read<GameState>().timesPosicionados![0], 1), 
                  child: iconeJogador(context: context, jogador: times[0].jogador1.jogador, cor: Color(0xFF1900FF)),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: times[0].jogador2?.getLadoQuadra?.axisX,
                  top: posicaoVertical(context.read<GameState>().timesPosicionados![0], 2), 
                  child: iconeJogador(context: context, jogador: times[0].jogador2?.jogador, cor: Color(0xFF1900FF)),
                ),
              if (!times[1].isDupla)
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: times[1].jogador1.getLadoQuadra?.axisX,
                  top: posicaoVertical(context.read<GameState>().timesPosicionados![1], 1), 
                  child: iconeJogador(context: context, jogador: times[1].jogador1.jogador, cor: Color(0xFFFF0004)),
                )
              else
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: times[1].jogador1.getLadoQuadra?.axisX,
                  top: posicaoVertical(context.read<GameState>().timesPosicionados![1], 1), 
                  child: iconeJogador(context: context, jogador: times[1].jogador1.jogador, cor: Color(0xFFFF0004)),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: times[1].jogador2?.getLadoQuadra?.axisX,
                  top: posicaoVertical(context.read<GameState>().timesPosicionados![1], 2), 
                  child: iconeJogador(context: context, jogador: times[1].jogador2?.jogador, cor: Color(0xFFFF0004)),
                )
            ],
          )
        ),
        Row(
          children: [
            SizedBox(width: 20),
            Container(width: 20,height: 20, decoration: BoxDecoration(color: Color(0xFFFF0004))),
            SizedBox(width: 7),
            Text((times[1].isDupla)?'Dupla 2': 'Jogador 2'),
          ],
        )
      ],
    ),
  );
}