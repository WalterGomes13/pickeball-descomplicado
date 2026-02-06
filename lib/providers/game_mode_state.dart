import 'package:flutter/material.dart';

class GameModeState extends ChangeNotifier{
  int _modoSelecionado = 1;

  int get modoSelecionado => _modoSelecionado;

  void escolherModo(int modo){
    _modoSelecionado = modo;
    notifyListeners();
  }
}