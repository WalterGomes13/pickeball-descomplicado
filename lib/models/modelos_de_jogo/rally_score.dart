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
    } else {
      novoTimeSacador.jogador1.definirJogador(ladoSacador, EstadoJogador.sacador);
      antigoTimeSacador.jogador1.definirJogador(ladoSacador, EstadoJogador.recebedor);
    }
  }

  @override
  void pontuarJogo(Time timePontuador, Time outroTime){
    timePontuador.incrementarPontuacao();
    if (existeVencedor(timePontuador, outroTime)){return;}
    if(timePontuador.isDupla){
      if(timePontuador.getSituacao == SituacaoJogo.atacando){
        trocarLadoSaque(timePontuador);
        mudarRecebedor(outroTime);
      } else {
        tomadaDeSaque(timePontuador, outroTime);
      }
    } else {
      if (timePontuador.getSituacao == SituacaoJogo.atacando){
        trocarLadoSaque(timePontuador);
        trocarLadoDefesa(outroTime);
      } else {
        tomadaDeSaque(timePontuador, outroTime);
      }
    }
  }
}