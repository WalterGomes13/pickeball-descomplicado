import 'jogador.dart';

enum LadoQuadra {
  esquerdo(63),
  direito(267);

  final double axisX;

  const LadoQuadra(this.axisX);
}

enum EstadoJogador {
  sacador,
  recebedor,
  parceiroSacador,
  parceiroRecebedor;
}

enum SituacaoJogo {
  atacando,
  defendendo
}

abstract class Jogo{
  Jogo({
    required this.categoriaJogo, 
    required this.jogadores,
    required this.maxPont
  }): jogadoresEmJogo = jogadores
      .map((j) => JogadorEmJogo(
        jogador: j))
        .toList();
      
  final int categoriaJogo;
  final List<Jogador> jogadores;
  final List<JogadorEmJogo> jogadoresEmJogo;
  int maxPont;
  List<Time>? times;
  Time? timeVencedor;
  
  void comecarJogo() {
    if (categoriaJogo == 1){
      jogadoresEmJogo[0].definirJogador(LadoQuadra.direito, EstadoJogador.sacador);
      jogadoresEmJogo[1].definirJogador(LadoQuadra.direito, EstadoJogador.recebedor);

      times = <Time>[
        Time(jogador1: jogadoresEmJogo[0]), 
        Time(jogador1: jogadoresEmJogo[1])
      ];

      times?[0].setSituacao(SituacaoJogo.atacando);
      times?[1].setSituacao(SituacaoJogo.defendendo);

    } else {
      jogadoresEmJogo[0].definirJogador(LadoQuadra.direito, EstadoJogador.sacador);
      jogadoresEmJogo[1].definirJogador(LadoQuadra.esquerdo, EstadoJogador.parceiroSacador);
      jogadoresEmJogo[2].definirJogador(LadoQuadra.direito, EstadoJogador.recebedor);
      jogadoresEmJogo[3].definirJogador(LadoQuadra.esquerdo, EstadoJogador.parceiroRecebedor);

      times = <Time>[
        Time(jogador1: jogadoresEmJogo[0], jogador2: jogadoresEmJogo[1]), 
        Time(jogador1: jogadoresEmJogo[2], jogador2: jogadoresEmJogo[3])
      ];

      times?[0].setSituacao(SituacaoJogo.atacando);
      times?[1].setSituacao(SituacaoJogo.defendendo);
    }
  }

  bool existeVencedor(Time timePontuador, Time outroTime){
    if (timePontuador.getPontuacao < maxPont){return false;}
    if (timePontuador.getPontuacao - outroTime.getPontuacao >=2){
      timeVencedor = timePontuador;
      return true;
    } else {
      maxPont+=1;
      return false;
    }
  }

  void trocarLadoSaque(Time time){ //potuou e inverteu a posicao de ataque
    if (time.getSituacao != SituacaoJogo.atacando){return;}
    LadoQuadra? ladoQuadraJ1 = time.jogador1.getLadoQuadra;
    if (time.isDupla){
      time.jogador1.setLadoQuadra(time.jogador2?.getLadoQuadra);
      time.jogador2?.setLadoQuadra(ladoQuadraJ1);
    } else {
      LadoQuadra novaLadoQuadraJ1 = (ladoQuadraJ1 == LadoQuadra.esquerdo)? LadoQuadra.direito : LadoQuadra.esquerdo;
      time.jogador1.setLadoQuadra(novaLadoQuadraJ1);
    }
  }

  void trocarLadoDefesa(Time time){
    if(time.getSituacao != SituacaoJogo.defendendo){return;}
    LadoQuadra? ladoQuadraJ1 = time.jogador1.getLadoQuadra;
    if(time.isDupla){
      time.jogador1.setLadoQuadra(time.jogador2?.getLadoQuadra);
      time.jogador2?.setLadoQuadra(ladoQuadraJ1);
    } else {
      LadoQuadra novoLadoQuadraJ1 = (ladoQuadraJ1 == LadoQuadra.esquerdo)? LadoQuadra.direito : LadoQuadra.esquerdo;
      time.jogador1.setLadoQuadra(novoLadoQuadraJ1);
    }
  }

  void mudarSacador(Time time){ // apos o jogador do primeiro servico perder
    if (!time.isDupla || time.getSituacao != SituacaoJogo.atacando){return;}
    EstadoJogador? estadoJogador1 = time.jogador1.getEstadoJogador;
    time.jogador1.setEstado(time.jogador2?.getEstadoJogador);
    time.jogador2?.setEstado(estadoJogador1);
  }

  void mudarRecebedor(Time time){ // quando a equipe recebedora perde um ponto
    if (!time.isDupla || time.getSituacao != SituacaoJogo.defendendo){return;}
    EstadoJogador? estadoJogador1 = time.jogador1.getEstadoJogador;
    time.jogador1.setEstado(time.jogador2?.getEstadoJogador);
    time.jogador2?.setEstado(estadoJogador1);
  }

  void tomadaDeSaque(Time novoTimeSacador, Time antigoTimeSacador);

  void pontuarJogo(Time timePontuador, Time outroTime);
}

class Time{
  Time({required this.jogador1, this.jogador2});
  final JogadorEmJogo jogador1;
  final JogadorEmJogo? jogador2;
  SituacaoJogo? situacaoJogo;
  int nSacador = 1;
  int pontuacao = 0;
  bool get isDupla => jogador2 != null;

  int get getPontuacao => pontuacao;
  void incrementarPontuacao() => pontuacao +=1;
  void decrementarPontuacao() => pontuacao = (pontuacao > 0) ? pontuacao - 1: pontuacao;

  SituacaoJogo? get getSituacao => situacaoJogo;
  void setSituacao(SituacaoJogo novaSituacao) => situacaoJogo = novaSituacao;

  int get getNSacador => nSacador;
  void setNSacador(int novoSacador) => nSacador = novoSacador;
}

class JogadorEmJogo{
  JogadorEmJogo({required this.jogador});

  final Jogador jogador; 
  LadoQuadra? ladoQuadra;
  EstadoJogador? estadoJogador;

  LadoQuadra? get getLadoQuadra => ladoQuadra;
  void setLadoQuadra(LadoQuadra? novaLadoQuadra) => ladoQuadra = novaLadoQuadra;

  EstadoJogador? get getEstadoJogador => estadoJogador;
  void setEstado(EstadoJogador? novaEstadoJogador) => estadoJogador = novaEstadoJogador;

  void definirJogador(LadoQuadra novaLadoQuadra, EstadoJogador novoEstado){
    ladoQuadra = novaLadoQuadra;
    estadoJogador = novoEstado;
  }
}
