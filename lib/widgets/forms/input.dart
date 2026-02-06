import 'package:flutter/material.dart';

class input extends StatelessWidget{
  const input({super.key,  required this.texto, required this.onSaved});

  final String texto;
  final FormFieldSetter<String> onSaved;

  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        final width = constraints.maxWidth;

        return SizedBox(
          width: width,
          child: TextFormField(
            keyboardType: TextInputType.name,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Colors.white)),
              hintText: texto,
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color.fromARGB(255, 88, 88, 88)),
              fillColor: Color(0xFFCACACA),
              filled: true
            ),
            validator: (value) {
              if (value ==  null || value.isEmpty) {
                return 'Digite seu $texto';
              }
              return null;
            },
            onSaved: onSaved
          ),
        );
      }
    );
  }
}