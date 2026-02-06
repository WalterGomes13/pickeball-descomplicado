import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pickleball_descomp_flutter/models/jogador.dart';
import 'jogador_form.dart';

import 'package:pickleball_descomp_flutter/providers/nome_state.dart';

class FormSimples extends StatefulWidget{
  const FormSimples({super.key, required this.formSimplesKey});

  final GlobalKey<FormState> formSimplesKey;

  @override
  State<FormSimples> createState() => _FormSimplesState();
}

class _FormSimplesState extends State<FormSimples>{

  @override
  Widget build(BuildContext context){
    final GeneroJ1 = context.select<NomeState, Genero?>((f) => f.GeneroJ1);
    final GeneroJ2 = context.select<NomeState, Genero?>((f) => f.GeneroJ2);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        final width = constraints.maxWidth.clamp(0, 636) * (300/393);

        return SizedBox(
          width: width,
          height: width * (381/300),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 46),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
            ),
            child: Form(
              key: widget.formSimplesKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  jogadorForm(
                    context: context, 
                    titulo: 'Jogador 1', 
                    GeneroSelecionado: GeneroJ1, 
                    onGeneroChanged: (value) => context.read<NomeState>().setGeneroJ1(value), 
                    onNomeSaved: (value) => context.read<NomeState>().setNomeJ1(value), 
                    onSobrenomeSaved: (value) => context.read<NomeState>().setSobrenomeJ1(value)
                  ),
                  SizedBox(height: 15),
                  jogadorForm(
                    context: context, 
                    titulo: 'Jogador 2', 
                    GeneroSelecionado: GeneroJ2, 
                    onGeneroChanged: (value) => context.read<NomeState>().setGeneroJ2(value), 
                    onNomeSaved: (value) => context.read<NomeState>().setNomeJ2(value), 
                    onSobrenomeSaved: (value) => context.read<NomeState>().setSobrenomeJ2(value)
                  )
                ],
              ),
            )
          ),
        );
      }
    );
  }
}