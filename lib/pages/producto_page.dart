
import 'package:flutter/material.dart';
import 'package:productos_app/widgets/imagen_producto.dart';

class ProductoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ImagenProducto()
                ],
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}