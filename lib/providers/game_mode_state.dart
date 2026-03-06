import 'package:flutter/material.dart';

class GameModeState extends ChangeNotifier{
  int _modoSelecionado = 1;
  bool _freezePoint = false;
  int _maxPoint = 15;

  int get modoSelecionado => _modoSelecionado;
  bool get freezePoint => _freezePoint;
  int get maxPoint => _maxPoint;

  void escolherModo(int modo){
    _modoSelecionado = modo;
    notifyListeners();
  }

  void jogoComFreeze(bool freezePoint){
    _freezePoint = freezePoint;
    notifyListeners();
  }

  void escolherPontuacao(int maxPoint){
    _maxPoint = maxPoint;
    notifyListeners();
  }
}