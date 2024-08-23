// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProductModel {
  final String? productId;
  final String? cateId;
  final String? productName;
  final double? price;
  final String? description;
  final int minSize;
  final int maxSize;
  final int quantity;
  final html.File? image;

  UpdateProductModel({
    this.productId,
    this.cateId,
    this.productName,
    this.price,
    this.description,
    required this.minSize,
    required this.maxSize,
    required this.quantity,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'categoryId': cateId,
      'name': productName,
      'price': price,
      'description': description,
      'sizes': List.generate(maxSize - minSize + 1, (index) => minSize + index),
      'quantity': quantity,
      'createAt': Timestamp.now(),
    };
  }
}
