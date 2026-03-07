import 'package:flutter/material.dart';
import '../widgets/buttons/button.dart';

class enterPage extends StatelessWidget{
  const enterPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                final width = constraints.maxWidth.clamp(0, 792) * (361/393);

                return SizedBox(
                  width: width,
                  child: Image(
                    image: AssetImage('assets/Logo_maior.png'),
                    fit: BoxFit.contain,
                  ),
                );
              }
            ),
            mainButton(
              texto: 'COMEÇAR', 
              formFunction: (){
                Navigator.pushNamed(context, '/categoria');
              }
            )
          ],
        )
      ) 
    );
  }
}
