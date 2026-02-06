import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pickleball_descomp_flutter/widgets/buttons/button.dart';
import 'package:pickleball_descomp_flutter/widgets/forms/form_simples.dart';
import 'package:pickleball_descomp_flutter/widgets/forms/form_duplas.dart';

import 'package:pickleball_descomp_flutter/providers/category_state.dart';
import 'package:pickleball_descomp_flutter/providers/nome_state.dart';

class NomesPage extends StatelessWidget{
  const NomesPage({super.key});

  @override
  Widget build(BuildContext context){
    final int? categoriaJogo = context.select<CategoryState, int?>((c)=>c.categoriaSelecionada);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (categoriaJogo == 1)
              ? FormSimples(formSimplesKey: formKey) 
              : FormDuplas(formDuplasKey: formKey),
            mainButton(
              enabled: true, 
              texto: 'COMEÇAR', 
              rota: '/jogo', 
              formFunction: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  (categoriaJogo == 1)
                    ? context.read<NomeState>().setSimples()
                    : context.read<NomeState>().setDupla();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}