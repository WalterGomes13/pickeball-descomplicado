import 'package:flutter/material.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';
import 'package:pickleball_descomp_flutter/models/modelos_de_jogo/rally_score.dart';
import 'package:pickleball_descomp_flutter/models/modelos_de_jogo/zero_dois.dart';

import 'package:pickleball_descomp_flutter/providers/category_state.dart';
import 'package:pickleball_descomp_flutter/providers/game_mode_state.dart';
import 'package:pickleball_descomp_flutter/providers/nome_state.dart';

class GameState extends ChangeNotifier{
  final CategoryState categoryState;
  final GameModeState gameModeState;
  final NomeState nomeState;
  Jogo? jogo;
  List<TimePosicionado> timesPosicionados = [];
  List<Jogada> jogadas = [];
  String? informacaoJogo;

  GameState(this.categoryState, this.gameModeState, this.nomeState);
  
  void comecar(){
    jogo = (gameModeState.modoSelecionado == 1) 
      ? ZeroDois(categoriaJogo: categoryState.categoriaSelecionada, jogadores: nomeState.jogadores, maxPont: 11)
      : RallyScore(categoriaJogo: categoryState.categoriaSelecionada, jogadores: nomeState.jogadores, maxPont: gameModeState.maxPoint, freezePoint: gameModeState.freezePoint);

    jogo?.comecarJogo();
    timesPosicionados.add(TimePosicionado(time: jogo!.times[0]));
    timesPosicionados.add(TimePosicionado(time: jogo!.times[1]));
    
    timesPosicionados[0].setLadoQuadraVertical(LadoQuadraVertical.superior);
    timesPosicionados[1].setLadoQuadraVertical(LadoQuadraVertical.inferior);

    jogadas.clear();
    jogadas.add(Jogada(times: timesPosicionados.map((t)=>t.copy()).toList(), jogo: jogo!.copy()));
  }

  void pontuar(Time timePontuador, Time outroTime){
    jogadas.add(Jogada(times: timesPosicionados.map((t)=>t.copy()).toList(), jogo: jogo!.copy()));
    if(jogo!.timeVencedor == null){
      jogo!.pontuarJogo(timePontuador, outroTime);
    }
    notifyListeners();
  }

  void desfazer(){
    final jogada = jogadas.removeLast();
    jogo = jogada.jogo.copy();
    timesPosicionados = [
      TimePosicionado(time: jogo!.times[0]),
      TimePosicionado(time: jogo!.times[1]),
    ];

    timesPosicionados[0].setLadoQuadraVertical(jogada.times[0].getLadoQuadraVertical);
    timesPosicionados[1].setLadoQuadraVertical(jogada.times[1].getLadoQuadraVertical);
    notifyListeners();
  }
}

enum LadoQuadraVertical{
  superior,
  inferior
}

class TimePosicionado{
  TimePosicionado({required this.time});

  final Time time;

  LadoQuadraVertical? _ladoQuadraVertical;
  LadoQuadraVertical? get getLadoQuadraVertical => _ladoQuadraVertical;
  void setLadoQuadraVertical(LadoQuadraVertical? ladoQuadraVertical) => _ladoQuadraVertical = ladoQuadraVertical;

  TimePosicionado copy(){
    TimePosicionado timePosicionado = TimePosicionado(time: time.copy());
    timePosicionado.setLadoQuadraVertical(getLadoQuadraVertical);

    return timePosicionado;
  }
}

class Jogada{
  const Jogada({required this.times, required this.jogo});

  final List<TimePosicionado> times;
  final Jogo jogo;
}