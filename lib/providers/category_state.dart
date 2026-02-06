import 'package:flutter/material.dart';

class CategoryState extends ChangeNotifier{
  int _categoriaSelecionada = 1;

  int get categoriaSelecionada => _categoriaSelecionada;

  void escolherCategoria(int categoria){
    _categoriaSelecionada = categoria;
    notifyListeners();
  }
}