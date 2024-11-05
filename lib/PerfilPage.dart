import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
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
                  "Perfil",
            ),
          SizedBox(height: 20),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Nombre',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Apellido',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Edad',
              ),
            ),TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Sexo',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'correo electronico',
              ),
            ),

            Text(
                  "Padeces diabetes ?",
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'S/N',
              ),
            ),
             Text(
                  "Padeces diabetes tus padres?",
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Padre/Madre/Ambos',
              ),
            ),

           Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  //appState.callModel();
                },
                child: Text('Guardar perfil'),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 
