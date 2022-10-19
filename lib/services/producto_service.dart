
import 'package:flutter/material.dart';
import '../models/producto.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductoService extends ChangeNotifier{
  
  final String _baseUrl='productosds02sv21mplt-default-rtdb.firebaseio.com';

  final List<Producto> productos = [];

  bool  isLoading = true;

  //constructor
  ProductoService(){
    this.obtenerProductos();
  }
  //metodo que obtiene los productos de la BD
  Future obtenerProductos() async{
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);
    
    final Map<String, dynamic> productosMap = json.decode(resp.body);

    //print(productosMap);

    //recorremos el mapa y extraemos cada producto y lo agregamos a la lista
    productosMap.forEach((key, value) {
      final productoTemp = Producto.fromMap(value);
      productoTemp.id = key;
      this.productos.add(productoTemp);
    });

    this.isLoading = false;

   notifyListeners();

   //print(this.productos[0].nombre);
   return this.productos;
  }
}