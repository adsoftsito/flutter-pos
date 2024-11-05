import 'package:flutter/material.dart';
//import 'package:innsalud/main.dart';
import 'package:provider/provider.dart';
import "MyAppState.dart";

class SeguimientoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();

    var appState = context.watch<MyAppState>();

    if (appState.token.isEmpty) {
      return Center(
        child: Text('No login yet.'),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

                Text(
                  "Bienvenido :  Angel",
                ),
          SizedBox(height: 20),

            Text(
                  "Seguimiento Semanal",
            ),
          SizedBox(height: 20),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Talla, altura (cms)',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Peso (kg)',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Medida cintura (cms)',
              ),
            ),TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Medida de cadera (cms)',
              ),
            ),
          SizedBox(height: 20),

            Text(
                  "Realizaste actividad fisica ?",
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Cuantas veces ?',
              ),
            ),
                      SizedBox(height: 20),

            Text(
                  "Ingeriste bebidas azucaradas ?",
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Cuantas veces ?',
              ),
            ),
          SizedBox(height: 20),
          SizedBox(height: 20),

           Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  //appState.callModel();
                },
                child: Text('Guardar registro'),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 
