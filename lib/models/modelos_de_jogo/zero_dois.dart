import '../jogo.dart';

class ZeroDois extends Jogo{
  ZeroDois({
    required super.categoriaJogo, 
    required super.jogadores,
    required super.maxPont
  });

  @override
  void tomadaDeSaque(Time novoTimeSacador, Time antigoTimeSacador){
    novoTimeSacador.setSituacao(SituacaoJogo.atacando);
    antigoTimeSacador.setSituacao(SituacaoJogo.defendendo);

    if (novoTimeSacador.isDupla){
      List<EstadoJogador> estadosNovoSacador = (novoTimeSacador.jogador1.getLadoQuadra == LadoQuadra.direito)
        ? [EstadoJogador.sacador, EstadoJogador.parceiroSacador] 
        : [EstadoJogador.parceiroSacador, EstadoJogador.sacador];

      List<EstadoJogador> estadosAntigoSacador = (antigoTimeSacador.jogador1.getLadoQuadra == LadoQuadra.direito)
        ? [EstadoJogador.recebedor, EstadoJogador.parceiroRecebedor]
        : [EstadoJogador.parceiroRecebedor, EstadoJogador.recebedor];
      
      novoTimeSacador.jogador1.setEstado(estadosNovoSacador[0]);
      novoTimeSacador.jogador2?.setEstado(estadosNovoSacador[1]);
      antigoTimeSacador.jogador1.setEstado(estadosAntigoSacador[0]);
      antigoTimeSacador.jogador2?.setEstado(estadosAntigoSacador[1]);
    } else {
      LadoQuadra novoLadoQuadra = (novoTimeSacador.getPontuacao % 2 == 0)? LadoQuadra.direito : LadoQuadra.esquerdo;
      novoTimeSacador.jogador1.definirJogador(novoLadoQuadra, EstadoJogador.sacador);
      antigoTimeSacador.jogador1.definirJogador(novoLadoQuadra, EstadoJogador.recebedor);
    }
  }

  @override
  void pontuarJogo(Time timePontuador, Time outroTime){
    if (timePontuador.isDupla){
      if (timePontuador.getSituacao == SituacaoJogo.atacando){
        timePontuador.incrementarPontuacao();
        if (existeVencedor(timePontuador, outroTime)){return;}
        trocarLadoSaque(timePontuador);
        mudarRecebedor(outroTime);
      } else {
        if(outroTime.getNSacador == 1){
          mudarSacador(outroTime);
          mudarRecebedor(timePontuador);
          outroTime.setNSacador(2);
        } else {
          tomadaDeSaque(timePontuador, outroTime);
          outroTime.setNSacador(1);
        }
      }
    } else {
      if (timePontuador.getSituacao == SituacaoJogo.atacando){
        timePontuador.incrementarPontuacao();
        if (existeVencedor(timePontuador, outroTime)){return;}
        trocarLadoSaque(timePontuador);
        trocarLadoDefesa(outroTime);
      } else {
        tomadaDeSaque(timePontuador, outroTime);
      }
    }
  }
}