import 'package:flutter/material.dart';

class RecomendacionesPage extends StatelessWidget {
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
                  "Recomendaciones",
            ),
          SizedBox(height: 20),

          SizedBox(height: 20),

            Text(
                  "De acuerdo a tu actividad reciente :",
            ),

            SizedBox(height: 20),
 Text(
                  "Felicidades, lo has hecho muy  bien",
            ),
Text(
                  "Te recomendamos mantenerte asi ..",
            ),
Text(
                  "Te recomiendo  hacer mas ejercicio",
            ),


            SizedBox(height: 40),

            Text(
                  "De acuerdo a tu consumo de bebidas azucaradas:",
            ),

              SizedBox(height: 20),
 Text(
                  "Felicidades, vas muy  bien",
            ),
Text(
                  "Te recomendamos mantenerte asi ..",
            ),
Text(
                  "Te recomiendo  reducir el consumo  ...",
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
                child: Text('Aceptar '),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 
