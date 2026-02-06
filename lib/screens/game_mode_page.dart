import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/buttons/button.dart';

import 'package:pickleball_descomp_flutter/providers/game_mode_state.dart';

const List<Widget> modosJogo = <Widget>[Text('0-0-2'), Text('Rally Score')];

class GameModePage extends StatelessWidget{
  const GameModePage({super.key});

  @override
  Widget build(BuildContext context){
    final modo = context.select<GameModeState, int?>((g)=>g.modoSelecionado);
    final List<bool> modosEscolhidos = <bool>[modo == 1, modo == 2];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                final width = constraints.maxWidth.clamp(0.0, 636.0) * (300/393);

                return SizedBox(
                  width: width ,
                  height: width * (158/300),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 46),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                    ),
                    child: Column(// descobrir pq está errado
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Modo de jogo', style: Theme.of(context).textTheme.bodySmall),
                        LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints){
                            final width = constraints.maxWidth ;

                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFCACACA),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: ToggleButtons(
                                direction: Axis.horizontal,
                                onPressed: (int index){
                                  context.read<GameModeState>().escolherModo(index + 1);
                                },
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                selectedColor: Colors.white,
                                selectedBorderColor: Color(0xFF31609D),
                                fillColor: Color(0xFF31609D),
                                color: Color(0xFF7D7373),
                                constraints: BoxConstraints(minHeight: width * (45.0/270.0), minWidth: (width - 3) / 2),
                                isSelected: modosEscolhidos,
                                children: modosJogo,
                              )
                            );
                          }
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
            mainButton(enabled: true, 
              texto: 'PRÓXIMO', 
              rota: '/nomes', 
              formFunction: null,
            )
          ],
        ),
      ),
    );
  }
}