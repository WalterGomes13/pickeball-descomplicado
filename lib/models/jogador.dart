enum Genero {Homem, Mulher}

class Jogador {
  const Jogador({required this.nome, required this.sobrenome, required this.genero});
  final String? nome;
  final String? sobrenome;
  final Genero? genero;
}
