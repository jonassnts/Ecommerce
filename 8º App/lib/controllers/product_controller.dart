import 'package:comercio/models/prduct_model.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier {
  //Lista de produtos
  final List<ProductModel> _products = [
    ProductModel(name: 'Macbook', price: 6000, desc: 'M3'),
    ProductModel(name: 'Smartphone', price: 7000, desc: 'Iphone 15'),
    ProductModel(name: 'Som', price: 550, desc: 'JBL')
  ];

  //Método para poder acessar os produtos
  List<ProductModel> get products => _products;

}
