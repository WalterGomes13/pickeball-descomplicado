import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/button.dart';

const List<Widget> categorias = <Widget>[Text('Simples'), Text('Dupla')];

class categoryState extends ChangeNotifier{
  int? _categoriaSelecionada;

  int? get categoriaSelecionada => _categoriaSelecionada;

  void escolherCategoria(int categoria){
    _categoriaSelecionada = categoria;
    notifyListeners();
  }
}

class categoryPage extends StatefulWidget{
  const categoryPage({super.key});

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage>{
  final List<bool> categoriasEscolhidas = <bool>[true, false];

  @override
  Widget build(BuildContext context){
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
                        Text('Categoria', style: Theme.of(context).textTheme.bodyMedium),
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
                                  setState(() {
                                    for (int i = 0; i < categoriasEscolhidas.length; i++){
                                      categoriasEscolhidas[i] = i == index;
                                    }
                                  });
                                },
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                selectedColor: Colors.white,
                                selectedBorderColor: Color(0xFF31609D),
                                fillColor: Color(0xFF31609D),
                                color: Color(0xFF7D7373),
                                constraints: BoxConstraints(minHeight: width * (45.0/270.0), minWidth: (width - 3) / 2),
                                isSelected: categoriasEscolhidas,
                                children: categorias,
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
              rota: '/modoJogo', 
              formFunction: () => context.read<categoryState>().escolherCategoria(categoriasEscolhidas[0] ? 1 : 2),
            )
          ],
        ),
      ),
    );
  }
}