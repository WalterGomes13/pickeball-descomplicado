import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';

import 'package:pickleball_descomp_flutter/widgets/gameView/icone_jogador.dart';

import 'package:pickleball_descomp_flutter/providers/game_state.dart';


Widget quadra({
  required BuildContext context,
  required double width
}) {
  List<TimePosicionado> timesPosicionados = context.watch<GameState>().timesPosicionados;
  double widthQuadra = width * (361/393);
  double heightQuadra = width * (793.56/393);

  double? posicaoVertical(TimePosicionado timePosicionado, int index){
    double? valorPosicao;
    LadoQuadraVertical? ladoQuadraVertical = timePosicionado.getLadoQuadraVertical;
    EstadoJogador? estadoJogador = (index == 1)
      ? timePosicionado.time.jogador1.estadoJogador
      : timePosicionado.time.jogador2?.estadoJogador;
    
    if (ladoQuadraVertical == LadoQuadraVertical.superior){
      valorPosicao = (estadoJogador == EstadoJogador.parceiroRecebedor) 
        ? heightQuadra * (174/793.56) 
        : heightQuadra * (16/793.56);
    } else if (ladoQuadraVertical == LadoQuadraVertical.inferior){
      valorPosicao = (estadoJogador == EstadoJogador.parceiroRecebedor)
        ? heightQuadra * (564/793.56)
        : heightQuadra * (698/793.56);
    }

    return valorPosicao;
  }

  double? posicaoHorizontal(TimePosicionado timePosicionado, int index){
    double? valorPosicao;
    LadoQuadraVertical? ladoQuadraVertical = timePosicionado.getLadoQuadraVertical;
    LadoQuadra? ladoQuadra = (index == 1)
      ? timePosicionado.time.jogador1.ladoQuadra
      : timePosicionado.time.jogador2?.ladoQuadra;

    if(ladoQuadraVertical == LadoQuadraVertical.superior){
      valorPosicao = (ladoQuadra == LadoQuadra.direito) ? widthQuadra * (37/361) : widthQuadra * (241/361);
    } else if (ladoQuadraVertical == LadoQuadraVertical.inferior){
      valorPosicao = (ladoQuadra == LadoQuadra.direito) ? widthQuadra * (241/361) : widthQuadra * (37/361);
    }

    print('''
      timePosicionado: ${timePosicionado.time.jogador1.ladoQuadra}, 
      valorPosicao: $valorPosicao,
      ladoQuadraVertical: $ladoQuadraVertical,
      ''');
    return valorPosicao;
  }


  return Container(
    clipBehavior: Clip.none,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(8)
    ),
    width: width * (361/393),
    height: width * (874/393),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 9,
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Container(width: 20,height: 20, decoration: BoxDecoration(color: Color(0xFF1900FF))),
            SizedBox(width: 7),
            Text((timesPosicionados[0].time.isDupla)?'Dupla 1': 'Jogador 1'),
          ],
        ),
        SizedBox(
          width: widthQuadra,
          height: heightQuadra,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              OverflowBox(
                maxWidth: width * (365.14/393),
                child: Image.asset('assets/Quadra.png', fit: BoxFit.cover,),
              ),
              if (!timesPosicionados[0].time.isDupla)
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: posicaoHorizontal(timesPosicionados[0], 1),
                  top: posicaoVertical(timesPosicionados[0], 1), 
                  child: iconeJogador(context: context, jogadorEmJogo: timesPosicionados[0].time.jogador1, cor: Color(0xFF1900FF)),
                )
              else ...[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: posicaoHorizontal(timesPosicionados[0], 1),
                  top: posicaoVertical(timesPosicionados[0], 1), 
                  child: iconeJogador(context: context, jogadorEmJogo: timesPosicionados[0].time.jogador1, cor: Color(0xFF1900FF)),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: posicaoHorizontal(timesPosicionados[0], 2),
                  top: posicaoVertical(timesPosicionados[0], 2), 
                  child: iconeJogador(context: context, jogadorEmJogo: timesPosicionados[0].time.jogador2, cor: Color(0xFF1900FF)),
                )],
              if (!timesPosicionados[1].time.isDupla)
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: posicaoHorizontal(timesPosicionados[1], 1),
                  top: posicaoVertical(timesPosicionados[1], 1), 
                  child: iconeJogador(context: context, jogadorEmJogo: timesPosicionados[1].time.jogador1, cor: Color(0xFFFF0004)),
                )
              else ...[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: posicaoHorizontal(timesPosicionados[1], 1),
                  top: posicaoVertical(timesPosicionados[1], 1), 
                  child: iconeJogador(context: context, jogadorEmJogo: timesPosicionados[1].time.jogador1, cor: Color(0xFFFF0004)),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  left: posicaoHorizontal(timesPosicionados[1], 2),
                  top: posicaoVertical(timesPosicionados[1], 2), 
                  child: iconeJogador(context: context, jogadorEmJogo: timesPosicionados[1].time.jogador2, cor: Color(0xFFFF0004)),
                )]
            ],
          )
        ),
        Row(
          children: [
            SizedBox(width: 20),
            Container(width: 20,height: 20, decoration: BoxDecoration(color: Color(0xFFFF0004))),
            SizedBox(width: 7),
            Text((timesPosicionados[1].time.isDupla)?'Dupla 2': 'Jogador 2'),
          ],
        )
      ],
    ),
  );
}