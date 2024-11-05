import 'package:flutter/material.dart';

class HistorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

                Text(
                  "Bienvenido :  Angel",
                ),
          SizedBox(height: 20),

            Text(
                  "Historial",
            ),
          SizedBox(height: 20),
          SizedBox(height: 20),

            Text(
                  "Talla   Peso      Cintura    Cadera    IMC    Fecha",
            ),

            Text(
                  "162      59        65       90       24.6        01/Oct/2024",
            ),
            Text(
                  "165      69        68       92       25.8        08/OCt/2024",
            ),
            Text(
                  "168      74        70       92       27.6        15/Oct/2024",
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
