import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/widgets/gameView/placar.dart';
import 'package:pickleball_descomp_flutter/widgets/gameView/quadra.dart';
import 'package:pickleball_descomp_flutter/widgets/gameView/buttons_pontuacao.dart';

import 'package:pickleball_descomp_flutter/providers/category_state.dart';
import 'package:pickleball_descomp_flutter/providers/game_mode_state.dart';
import 'package:pickleball_descomp_flutter/providers/nome_state.dart';
import 'package:pickleball_descomp_flutter/providers/game_state.dart';

class GamePage extends StatelessWidget{
  const GamePage({super.key});

  @override
  Widget build(BuildContext context){

    final category = context.read<CategoryState>();
    final mode = context.read<GameModeState>();
    final nome = context.read<NomeState>();

    return ChangeNotifierProvider(
      create: (_) => GameState(category, mode, nome)..comecar(),
        child: Scaffold(
        body: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              final width = constraints.maxWidth.clamp(0.0, 636.0);

              return SizedBox(
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 9,
                    children: [
                      placar(context: context, width: width),
                      quadra(context: context, width: width),
                      buttonsPontuacao(context: context, width: width)
                    ],
                  )
                )
              );
            }
          ),
        )
      )
    );
  }
}