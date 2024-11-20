//import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
//import 'package:innsalud/main.dart';
import 'package:provider/provider.dart';
import "MyAppState.dart";

String loginPostMutation = """
mutation TokenAuth(\$username : String!,  \$password : String!) {
  tokenAuth(
    username: \$username 
    password: \$password 
  ) {
    token
  }
}
""";
/*
class LoginPage extends StatefulWidget {
  @override
  LoginWidget createState() => LoginWidget();
}
*/

//class LoginWidget extends State<LoginPage> {

class LoginPage extends StatelessWidget {

//StatefulWidget {
// StatelessWidget {
//class _LoginWidgetState extends State<LoginWidget> {

final String _email = '';
final String _password = '';

/*
Future<QueryResult> _login() async {
    final mutation = gql(r'''
      mutation LoginUser($email: String!, $password: String!) {
        login(email: $email, password: $password) {
          token
        }
      }
    ''');

    final variables = {'email': _email, 'password': _password};

    return runMutation(mutation, variables);
  }

*/

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();



    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

                Text(
                  "Ingrese credenciales",
                ),

          Column(
            //mainAxisSize: MainAxisSize.min, 
                    mainAxisAlignment: MainAxisAlignment.center,

            children: [
            TextFormField(
                keyboardType: TextInputType.text,
                controller: userNameController,
                decoration: InputDecoration(
                   labelText: 'Email',
                    border: OutlineInputBorder(),
                    hintText: 'usuario',

                  ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordController,

                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),

                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Mutation(
                options: MutationOptions(
                  document: gql(loginPostMutation),
                  // ignore: void_checks
                  update: (cache, result) {
                      return cache;
                  },
                  onCompleted: (result) {
                    
            // Update the cache using refetchQuery
                    if (result == null) {
                       print('Completed with errors ');
                    }
                    else {
                      print('ok ...');
                      appState.token = result["tokenAuth"]["token"].toString();
                      print(result["tokenAuth"]["token"]);
                    }
                  },
                  onError: (error)  {
                    print('error :');
                    
                        appState.username = error!.graphqlErrors[0].message.toString();

                    
                    
                    print(error.graphqlErrors[0].message);
                  },

                ),
                builder: ( runMutation,  result) {

                  return ElevatedButton(
                  onPressed: ()  {
                    // ignore: await_only_futures
                    runMutation({ "username": userNameController.text,
                                                 "password": passwordController.text
                                  });
                  },
                  child: const Text('Login'),
                   );
                }
            
            
            ),
            Text(
              "error :${appState.username}",
              style: TextStyle(fontSize: 12),
            ),

            ],
          ),

          SizedBox(height: 20),
              Text(
                  "Crear usuario  nuevo",
                ),

          Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
          
          TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'email',
              ),
            ),

          TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'usuario',
              ),
            ),
          TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'password',
              ),
            ),
          TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'repetir password',
              ),
            ),

            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  //appState.callModel();
                },
                child: Text('ingresar'),
              ),
            ],
          ),




        ],


        
      ),
    );

   /*
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Login'),
              ),
	      
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  //appState.getNext();
                },
                child: Text('New user'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
    */
  }
  
}
