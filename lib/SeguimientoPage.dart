import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'MyAppState.dart';


String addProductMutation = """
mutation AddProduct(
  \$imageUrl: String!, 
  \$productName: String!, 
  \$price: Float!, 
  \$description: String!, 
  \$content: String!, 
  \$flavor: String!, 
  \$productId: String!
) {
  addProduct(
    imageUrl: \$imageUrl, 
    productName: \$productName, 
    price: \$price, 
    description: \$description, 
    content: \$content, 
    flavor: \$flavor, 
    productId: \$productId
  ) {
    productName
    price
    description
    content
    flavor
    productId
  }
}
""";

class SeguimientoPage extends StatelessWidget {
  const SeguimientoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {r
    var appState = context.watch<MyAppState>();

    if (appState.token.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Seguimiento'),
        ),
        body: const Center(
          child: Text('No has iniciado sesión.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido, ${appState.username}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Agregar Producto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Expanded(child: ProductForm()),
          ],
        ),
      ),
    );
  }
}

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  ProductFormState createState() => ProductFormState();
}

class ProductFormState extends State<ProductForm> {
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController flavorController = TextEditingController();
  final TextEditingController productIdController = TextEditingController();

  void clearFields() {
    imageUrlController.clear();
    productNameController.clear();
    priceController.clear();
    descriptionController.clear();
    contentController.clear();
    flavorController.clear();
    productIdController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(addProductMutation),
        onCompleted: (result) {
          if (result != null && result['addProduct'] != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Producto agregado exitosamente')),
            );
            clearFields();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error al agregar el producto')),
            );
          }
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${error?.graphqlErrors.first.message ?? "Desconocido"}'),
            ),
          );
        },
      ),
      builder: (runMutation, result) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'URL de la imagen',
                  prefixIcon: Icon(Icons.image),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: productNameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del producto',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Precio',
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  prefixIcon: Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: 'Contenido',
                  prefixIcon: Icon(Icons.list_alt),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: flavorController,
                decoration: const InputDecoration(
                  labelText: 'Sabor',
                  prefixIcon: Icon(Icons.emoji_food_beverage),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: productIdController,
                decoration: const InputDecoration(
                  labelText: 'ID del producto',
                  prefixIcon: Icon(Icons.qr_code),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (imageUrlController.text.isNotEmpty &&
                      productNameController.text.isNotEmpty &&
                      priceController.text.isNotEmpty) {
                    runMutation({
                      'imageUrl': imageUrlController.text,
                      'productName': productNameController.text,
                      'price': double.tryParse(priceController.text) ?? 0.0,
                      'description': descriptionController.text,
                      'content': contentController.text,
                      'flavor': flavorController.text,
                      'productId': productIdController.text,
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Completa todos los campos requeridos')),
                    );
                  }
                },
                child: const Text('Agregar Producto'),
              ),
            ],
          ),
        );
      },
    );
  }
}
