import '../jogo.dart';

class RallyScore extends Jogo{
  RallyScore({
    required super.categoriaJogo,
    required super.jogadores,
    required super.maxPont,
    required this.freezePoint
  });

  final bool? freezePoint;

  @override
  Jogo copy(){
    RallyScore rallyScore = RallyScore(categoriaJogo: categoriaJogo, jogadores: jogadores, maxPont: maxPont, freezePoint: freezePoint);
    rallyScore.times = times.map((t)=>t.copy()).toList();
    rallyScore.timeVencedor = timeVencedor?.copy();
    rallyScore.informacaoJogo = informacaoJogo;

    return rallyScore;
  }

  @override
  bool existeVencedor(Time timePontuador, Time outroTime){
    if (timePontuador.getPontuacao < maxPont){return false;}
    if (timePontuador.getPontuacao - outroTime.getPontuacao >=2){
      if (freezePoint!){
        bool situacaoJogo = timePontuador.getSituacao == SituacaoJogo.atacando;
        if (situacaoJogo) {
          timeVencedor = timePontuador;
          informacaoJogo = (timePontuador.isDupla)
            ? "Acabou! ${timeVencedor!.jogador1.jogador.nome} e ${timeVencedor!.jogador2!.jogador.nome} vencem!"
            : "Acabou! ${timeVencedor!.jogador1.jogador.nome} vence!";
        }
        return situacaoJogo;
      } else {
        timeVencedor = timePontuador;
        informacaoJogo = (timePontuador.isDupla)
          ? "Acabou! ${timeVencedor!.jogador1.jogador.nome} e ${timeVencedor!.jogador2!.jogador.nome} vencem!"
          : "Acabou! ${timeVencedor!.jogador1.jogador.nome} vence!";
        return true;
      }
    } else {
      maxPont+=1;
      return false;
    }

  }

  @override
  void tomadaDeSaque(Time novoTimeSacador, Time antigoTimeSacador){
    trocarLadoDefesa(novoTimeSacador);
    novoTimeSacador.setSituacao(SituacaoJogo.atacando);
    antigoTimeSacador.setSituacao(SituacaoJogo.defendendo);

    LadoQuadra ladoSacador = (novoTimeSacador.getPontuacao % 2 == 0)
      ? LadoQuadra.direito : LadoQuadra.esquerdo;
    if (novoTimeSacador.isDupla){
      List<EstadoJogador> estadosNovoSacador  = (novoTimeSacador.jogador1.getLadoQuadra == ladoSacador)
        ? [EstadoJogador.sacador, EstadoJogador.parceiroSacador]
        : [EstadoJogador.parceiroSacador, EstadoJogador.sacador];

      List<EstadoJogador> estadosAntigoSacador = (antigoTimeSacador.jogador1.getLadoQuadra == ladoSacador)
        ? [EstadoJogador.recebedor, EstadoJogador.parceiroRecebedor]
        : [EstadoJogador.parceiroRecebedor, EstadoJogador.recebedor];

      novoTimeSacador.jogador1.setEstado(estadosNovoSacador[0]);
      novoTimeSacador.jogador2?.setEstado(estadosNovoSacador[1]);
      antigoTimeSacador.jogador1.setEstado(estadosAntigoSacador[0]);
      antigoTimeSacador.jogador2?.setEstado(estadosAntigoSacador[1]);
      informacaoJogo = "Tomada de saque! Agora ${novoTimeSacador.jogador1.jogador.nome} e ${novoTimeSacador.jogador2!.jogador.nome} estão atacando";
    } else {
      novoTimeSacador.jogador1.definirJogador(ladoSacador, EstadoJogador.sacador);
      antigoTimeSacador.jogador1.definirJogador(ladoSacador, EstadoJogador.recebedor);
      informacaoJogo = "Tomada de saque! Agora ${novoTimeSacador.jogador1.jogador.nome} está sacando";
    }
  }

  @override
  bool pontuarJogo(Time timePontuador, Time outroTime){
    if (existeVencedor(timePontuador, outroTime)){return false;}
    timePontuador.incrementarPontuacao();
    if(timePontuador.isDupla){
      if(timePontuador.getSituacao == SituacaoJogo.atacando){
        trocarLadoSaque(timePontuador);
        mudarRecebedor(outroTime);
        informacaoJogo = "Ponto para ${timePontuador.jogador1.jogador.nome} e ${timePontuador.jogador2!.jogador.nome}!";
      } else {
        tomadaDeSaque(timePontuador, outroTime);
        informacaoJogo = "Ponto e tomada de saque para ${timePontuador.jogador1.jogador.nome} e ${timePontuador.jogador2!.jogador.nome}!";
      }
    } else {
      if (timePontuador.getSituacao == SituacaoJogo.atacando){
        trocarLadoSaque(timePontuador);
        trocarLadoDefesa(outroTime);
        informacaoJogo = "Ponto para ${timePontuador.jogador1.jogador.nome}!";
      } else {
        tomadaDeSaque(timePontuador, outroTime);
        informacaoJogo = "Ponto e tomada de saque para ${timePontuador.jogador1.jogador.nome}";
      }
    }

    return true;
  }
}