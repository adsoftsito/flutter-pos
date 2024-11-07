import 'package:barcode_scan2/barcode_scan2.dart'; // Verifica esta importación
import 'package:flutter/material.dart';

class SistemaProductPage extends StatefulWidget {
  @override
  _SistemaProductPageState createState() => _SistemaProductPageState();
}

class _SistemaProductPageState extends State<SistemaProductPage> {
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();

  List<Map<String, dynamic>> _products = [];
  double _total = 0.0;
  double _change = 0.0;

  final Map<String, Map<String, dynamic>> _productCatalog = {
    '001': {
      'description': 'Coca Cola',
      'price': 12.0,
      'image': '/assets/img/cocacola.png',
    },
    '002': {
      'description': 'Pepsi',
      'price': 12.0,
      'image': '/assets/img/pepsi.webp',
    },
    '003': {
      'description': 'Sabritas',
      'price': 15.0,
      'image': '/assets/img/sabritas.webp',
    },
    '004': {
      'description': 'Boing',
      'price': 10.0,
      'image': '/assets/img/boing.webp',
    },
    '7500478018970': {
      'description': 'Cacahuates',
      'price': 25.0,
      'image': '/assets/img/cocacola.png',
    },
  };

  void _addProduct() {
    String productCode = _productCodeController.text.trim();
    if (_productCatalog.containsKey(productCode)) {
      setState(() {
        var productInfo = _productCatalog[productCode];
        _products.add({
          'description': productInfo!['description'],
          'price': productInfo['price'],
          'quantity': 1,
          'image': productInfo['image'],
        });
        _calculateTotal();
      });
      _productCodeController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Código de producto no válido')),
      );
    }
  }

  void _increaseQuantity(int index) {
    setState(() {
      _products[index]['quantity']++;
      _calculateTotal();
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (_products[index]['quantity'] > 1) {
        _products[index]['quantity']--;
        _calculateTotal();
      }
    });
  }

  void _removeProduct(int index) {
    setState(() {
      _products.removeAt(index);
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    _total = _products.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  void _calculateChange() {
    double payment = double.tryParse(_paymentController.text) ?? 0.0;
    setState(() {
      _change = payment - _total;
    });
  }

  Future<void> _scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan(); // Aquí se usa el BarcodeScanner del paquete barcode_scan2
      if (result.rawContent.isNotEmpty) {
        setState(() {
          _productCodeController.text = result.rawContent;
        });
        _addProduct();
      } else {
        print('No se escaneó ningún código');
      }
    } catch (e) {
      print('Error al escanear el código: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla de Venta de Productos"),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _productCodeController,
                    decoration: InputDecoration(
                      labelText: "Código del Producto",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: Text("Agregar"),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _scanBarcode,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Imagen")),
                    DataColumn(label: Text("Descripción")),
                    DataColumn(label: Text("Cantidad")),
                    DataColumn(label: Text("Importe")),
                    DataColumn(label: Text("Acciones")),
                  ],
                  rows: _products.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> product = entry.value;

                    return DataRow(cells: [
                      DataCell(Image.asset(
                        product['image'],
                        width: 50,
                        height: 50,
                      )),
                      DataCell(Text(product['description'])),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => _decreaseQuantity(index),
                          ),
                          Text(product['quantity'].toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => _increaseQuantity(index),
                          ),
                        ],
                      )),
                      DataCell(Text((product['price'] * product['quantity']).toStringAsFixed(2))),
                      DataCell(IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeProduct(index),
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total a Pagar: \$${_total.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _paymentController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Pagó",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _calculateChange,
                            child: Text("Calcular Cambio"),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Cambio: \$${_change.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
