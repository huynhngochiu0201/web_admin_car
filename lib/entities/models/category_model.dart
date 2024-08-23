import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? id;
  final String? name;
  final dynamic image;
  final Timestamp createAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        createAt: json['createAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'createAt': createAt,
    };
  }
}

