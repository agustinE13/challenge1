import 'package:flutter/material.dart';

class ImageMotos {
  ImageMotos(this.image, this.color);
  final String image;
  final Color color;
}

class Motos {
  Motos(this.name, this.category, this.price, this.punctuation, this.listImage,this.description);
  final String name;
  final String category;
  final String price;
  final int punctuation;
  final List<ImageMotos> listImage;
  final String description;
}
