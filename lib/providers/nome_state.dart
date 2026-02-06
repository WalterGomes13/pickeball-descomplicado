import 'package:flutter/material.dart';

import 'package:pickleball_descomp_flutter/models/jogador.dart';

class NomeState extends ChangeNotifier{

  String? _nomeJ1;
  String? get nomeJ1 => _nomeJ1;
  void setNomeJ1 (String? nomeJ1) => _nomeJ1 = nomeJ1;

  String? _sobrenomeJ1;
  String? get sobrenomeJ1 => _sobrenomeJ1;
  void setSobrenomeJ1 (String? sobrenomeJ1) => _sobrenomeJ1 = sobrenomeJ1;

  Genero? _GeneroJ1 = Genero.Homem;
  Genero? get GeneroJ1 => _GeneroJ1;
  void setGeneroJ1 (Genero? GeneroJ1){
    _GeneroJ1 = GeneroJ1;
    notifyListeners();
  }

  String? _nomeJ2;
  String? get nomeJ2 => _nomeJ2;
  void setNomeJ2 (String? nomeJ2) => _nomeJ2 = nomeJ2;

  String? _sobrenomeJ2;
  String? get sobrenomeJ2 => _sobrenomeJ2;
  void setSobrenomeJ2 (String? sobrenomeJ2) => _sobrenomeJ2 = sobrenomeJ2;

  Genero? _GeneroJ2 = Genero.Homem;
  Genero? get GeneroJ2 => _GeneroJ2;
  void setGeneroJ2 (Genero? GeneroJ2){
    _GeneroJ2 = GeneroJ2;
    notifyListeners();
  }

  String? _nomeJ3;
  String? get nomeJ3 => _nomeJ3;
  void setNomeJ3 (String? nomeJ3) => _nomeJ3 = nomeJ3;

  String? _sobrenomeJ3;
  String? get sobrenomeJ3 => _sobrenomeJ3;
  void setSobrenomeJ3 (String? sobrenomeJ3) => _sobrenomeJ3 = sobrenomeJ3;

  Genero? _GeneroJ3 = Genero.Homem;
  Genero? get GeneroJ3 => _GeneroJ3;
  void setGeneroJ3 (Genero? GeneroJ3){
    _GeneroJ3 = GeneroJ3;
    notifyListeners();
  }

  String? _nomeJ4;
  String? get nomeJ4 => _nomeJ4;
  void setNomeJ4 (String? nomeJ4) => _nomeJ4 = nomeJ4;

  String? _sobrenomeJ4;
  String? get sobrenomeJ4 => _sobrenomeJ4;
  void setSobrenomeJ4 (String? sobrenomeJ4) => _sobrenomeJ4 = sobrenomeJ4;

  Genero? _GeneroJ4 = Genero.Homem;
  Genero? get GeneroJ4 => _GeneroJ4;
  void setGeneroJ4 (Genero? GeneroJ4){
    _GeneroJ4 = GeneroJ4;
    notifyListeners();
  }

  List<Jogador> _jogadores = [];

  List<Jogador> get jogadores => List.unmodifiable(_jogadores);

  void setSimples(){
    Jogador j1 = Jogador(nome: nomeJ1, sobrenome: sobrenomeJ1, genero: GeneroJ1);
    Jogador j2 = Jogador(nome: nomeJ2, sobrenome: sobrenomeJ2, genero: GeneroJ2);
    _jogadores = [j1, j2];
    notifyListeners();
  }

  void setDupla(){
    Jogador j1 = Jogador(nome: nomeJ1, sobrenome: sobrenomeJ1, genero: GeneroJ1);
    Jogador j2 = Jogador(nome: nomeJ2, sobrenome: sobrenomeJ2, genero: GeneroJ2);
    Jogador j3 = Jogador(nome: nomeJ3, sobrenome: sobrenomeJ3, genero: GeneroJ3);
    Jogador j4 = Jogador(nome: nomeJ4, sobrenome: sobrenomeJ4, genero: GeneroJ4);
    _jogadores = [j1,j2,j3,j4];
    notifyListeners();
  }

  void reset(){
    _jogadores = [];
    notifyListeners();
  }
}