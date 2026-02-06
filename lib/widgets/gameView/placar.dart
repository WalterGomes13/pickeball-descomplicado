import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/providers/game_state.dart';

import 'package:pickleball_descomp_flutter/models/jogo.dart';

Widget placar({
  required BuildContext context,
  required double width,
}) {
  final List<Time>? times = context.watch<GameState>().jogo?.times;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary
    ),
    height: width * (198/393),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [ 
        (!times![0].isDupla)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white, 
                radius: 47/2,
                child: Text('J1',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFF1900FF))),
              ),
              SizedBox(width: 16),
              Text('${times[0].jogador1.jogador.nome?[0]}. ${times[0].jogador1.jogador.sobrenome}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
              Expanded(child: 
                Consumer<GameState>(
                  builder: (BuildContext context, gameState, _){
                    return Text('${gameState.jogo?.times?[0].getPontuacao}', textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 32, color: Theme.of(context).colorScheme.onSecondary));
                  }
                )
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 58,
                height: 47,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 18,
                      right: 29,
                      child: CircleAvatar(
                        backgroundColor: Colors.white, 
                        radius: 29/2,
                        child: Text('J1',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFF1900FF))),
                      ),
                    ),
                    Positioned(
                      top: 18,
                      left: 29,
                      child: CircleAvatar(
                        backgroundColor: Colors.white, 
                        radius: 29/2,
                        child: Text('J2',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFF1900FF))),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 126,
                height: 67,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${times[0].jogador1.jogador.nome?[0]}. ${times[0].jogador1.jogador.sobrenome}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                    Text('${times[0].jogador2?.jogador.nome?[0]}. ${times[0].jogador2?.jogador.sobrenome}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),)
                  ],
                ),
              ),
              Expanded(child: 
                Consumer<GameState>(
                  builder: (BuildContext context, gameState, _){
                    return Text('${gameState.jogo?.times?[0].getPontuacao}', textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 32, color: Theme.of(context).colorScheme.onSecondary));
                  }
                )
              )
            ],
          ),
        SizedBox(height: 13),
        (!times[1].isDupla)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 47/2,
                child: Text('J2',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFFFF0004))),
              ),
              SizedBox(width: 16),
              Text('${times[1].jogador1.jogador.nome?[0]}. ${times[1].jogador1.jogador.sobrenome}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
              Expanded(child: 
                Consumer<GameState>(
                  builder: (BuildContext context, gameState, _){
                    return Text('${gameState.jogo?.times?[1].getPontuacao}', textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 32, color: Theme.of(context).colorScheme.onSecondary));
                  }
                )
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 58,
                height: 47,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 18,
                      right: 29,
                      child: CircleAvatar(
                        backgroundColor: Colors.white, 
                        radius: 29/2,
                        child: Text('J3',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFFFF0004))),
                      ),
                    ),
                    Positioned(
                      top: 18,
                      left: 29,
                      child: CircleAvatar(
                        backgroundColor: Colors.white, 
                        radius: 29/2,
                        child: Text('J4',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFFFF0004))),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 126,
                height: 67,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${times[1].jogador1.jogador.nome?[0]}. ${times[1].jogador1.jogador.sobrenome}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                    Text('${times[1].jogador2?.jogador.nome?[0]}. ${times[1].jogador2?.jogador.sobrenome}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),)
                  ],
                ),
              ),
              Expanded(child: 
                Consumer<GameState>(
                  builder: (BuildContext context, gameState, _){
                    return Text('${gameState.jogo?.times?[1].getPontuacao}', textAlign: TextAlign.right, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 32, color: Theme.of(context).colorScheme.onSecondary));
                  }
                )
              )
            ],
          )
      ],
    ),
  );
}