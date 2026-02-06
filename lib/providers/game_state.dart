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
  List<TimePosicionado>? timesPosicionados;

  GameState(this.categoryState, this.gameModeState, this.nomeState);
  
  void comecar(){
    jogo = (gameModeState.modoSelecionado == 1) 
      ? ZeroDois(categoriaJogo: categoryState.categoriaSelecionada, jogadores: nomeState.jogadores, maxPont: 11)
      : RallyScore(categoriaJogo: categoryState.categoriaSelecionada, jogadores: nomeState.jogadores, maxPont: 21, freezePoint: null);

    jogo?.comecarJogo();
    timesPosicionados = [
      TimePosicionado(time: jogo?.times?[0]),
      TimePosicionado(time: jogo?.times?[1])
    ];
    timesPosicionados?[0].setLadoQuadraVertical(LadoQuadraVertical.superior);
    timesPosicionados?[1].setLadoQuadraVertical(LadoQuadraVertical.inferior);
  }

  void pontuar(Time timePontuador, Time outroTime){
    jogo?.pontuarJogo(timePontuador, outroTime);
    notifyListeners();
  }
}

enum LadoQuadraVertical{
  superior,
  inferior
}

class TimePosicionado{
  TimePosicionado({required this.time});

  final Time? time;
  LadoQuadraVertical? _ladoQuadraVertical;

  LadoQuadraVertical? get getLadoQuadraVertical => _ladoQuadraVertical;
  void setLadoQuadraVertical(LadoQuadraVertical? ladoQuadraVertical) => _ladoQuadraVertical = ladoQuadraVertical;
}