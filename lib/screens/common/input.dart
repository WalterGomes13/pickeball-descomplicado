import 'package:flutter/material.dart';

class input extends StatelessWidget{
  const input({super.key,  required this.texto});

  final String texto;

  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        final width = constraints.maxWidth;

        return SizedBox(
          width: width,
          child: TextField(
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Colors.white)),
              hintText: texto,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Color.fromARGB(255, 88, 88, 88)),
              fillColor: Color(0xFFCACACA),
              filled: true
            ),
          ),
        );
      }
    );
  }
}