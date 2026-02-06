import 'package:flutter/material.dart';
import 'package:pickleball_descomp_flutter/widgets/forms/input.dart';
import 'package:pickleball_descomp_flutter/widgets/forms/radio.dart';
import 'package:pickleball_descomp_flutter/models/jogador.dart';

Widget jogadorForm({
  required BuildContext context,
  required String titulo,
  required Genero? GeneroSelecionado,
  required ValueChanged<Genero?> onGeneroChanged,
  required FormFieldSetter<String?> onNomeSaved,
  required FormFieldSetter<String?> onSobrenomeSaved
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(titulo, style: Theme.of(context).textTheme.bodySmall),
      SizedBox(height: 5),
      input(texto: 'Nome', onSaved: onNomeSaved),
      SizedBox(height: 10),
      input(texto: 'Sobrenome', onSaved: onSobrenomeSaved),
      escolhaGenero(
        GeneroSelecionado: GeneroSelecionado, 
        onChanged: onGeneroChanged
      )
    ],
  );
}