class AddProductModel {
  final String? productId;
  final String productName;
  final double price;
  final int quantity;
  final String cateId;
  final String desctiption;
  final dynamic image;

  AddProductModel(
      {this.productId,
      required this.productName,
      required this.price,
      required this.quantity,
      required this.cateId,
      required this.desctiption,
      required this.image});
}
