import '../jogo.dart';

class ZeroDois extends Jogo{
  ZeroDois({
    required super.categoriaJogo, 
    required super.jogadores,
    required super.maxPont
  });

  @override
  Jogo copy(){
    ZeroDois zeroDois = ZeroDois(categoriaJogo: categoriaJogo, jogadores: jogadores, maxPont: maxPont);
    zeroDois.times = times.map((t)=>t.copy()).toList();
    zeroDois.timeVencedor = timeVencedor?.copy();
    zeroDois.informacaoJogo = informacaoJogo;

    return zeroDois;
  }

  @override
  bool existeVencedor(Time timePontuador, Time outroTime){
    if (timePontuador.getPontuacao < maxPont){return false;}
    if (timePontuador.getPontuacao - outroTime.getPontuacao >=2){
      timeVencedor = timePontuador;
      informacaoJogo = (timePontuador.isDupla)
      ? "Acabou! ${timePontuador.jogador1.jogador.nome} e ${timePontuador.jogador2!.jogador.nome} vencem!"
      : "Acabou! ${timePontuador.jogador1.jogador.nome} vence!";
      return true;
    } else {
      maxPont+=1;
      return false;
    }
  }

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
      informacaoJogo = "Tomada de saque! Agora ${novoTimeSacador.jogador1.jogador.nome} e ${novoTimeSacador.jogador2!.jogador.nome} estão atacando";
    } else {
      LadoQuadra novoLadoQuadra = (novoTimeSacador.getPontuacao % 2 == 0)? LadoQuadra.direito : LadoQuadra.esquerdo;
      novoTimeSacador.jogador1.definirJogador(novoLadoQuadra, EstadoJogador.sacador);
      antigoTimeSacador.jogador1.definirJogador(novoLadoQuadra, EstadoJogador.recebedor);
      informacaoJogo = "Tomada de saque! Agora ${novoTimeSacador.jogador1.jogador.nome} está sacando";
    }
  }

  @override
  bool pontuarJogo(Time timePontuador, Time outroTime){
    if (timePontuador.isDupla){
      if (timePontuador.getSituacao == SituacaoJogo.atacando){
        timePontuador.incrementarPontuacao();
        if (existeVencedor(timePontuador, outroTime)){return false;}
        trocarLadoSaque(timePontuador);
        mudarRecebedor(outroTime);
        informacaoJogo = "Ponto para ${timePontuador.jogador1.jogador.nome} e ${timePontuador.jogador2!.jogador.nome}!";
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
        if (existeVencedor(timePontuador, outroTime)){return false;}
        trocarLadoSaque(timePontuador);
        trocarLadoDefesa(outroTime);
        informacaoJogo = "Ponto para ${timePontuador.jogador1.jogador.nome}!";
      } else {
        tomadaDeSaque(timePontuador, outroTime);
      }
    }

    return true;
  }
}