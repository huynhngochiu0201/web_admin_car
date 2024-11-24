import 'package:web_admin_car/entities/models/cart_model.dart';

class AddCheckoutModel {
  final String? userId;
  final List<CartModel> cartData;
  final double? totalPrice;
  final int? totalProduct;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final DateTime? createdAt;
  final String? status;

  AddCheckoutModel({
    this.userId,
    required this.cartData,
    this.totalPrice,
    this.totalProduct,
    this.email,
    this.name,
    this.phoneNumber,
    this.address,
    this.createdAt,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'uId': userId,
      'cartData': cartData.map((cart) => cart.toJson()).toList(),
      'totalPrice': totalPrice,
      'totalProduct': totalProduct,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'createdAt': createdAt,
      'status': status,
    };
  }
}
