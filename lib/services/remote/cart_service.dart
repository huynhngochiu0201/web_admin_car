import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:web_admin_car/constants/define_collection.dart';
import 'package:web_admin_car/entities/models/cart_model.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userEmail => _auth.currentUser!.email!;

  Future<String> addToCart(CartModel cartModel) async {
    String res = "Some error occurred";
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppDefineCollection.APP_USER)
          .doc(userEmail)
          .collection(AppDefineCollection.APP_CART)
          .where('productId', isEqualTo: cartModel.productId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentReference docRef = snapshot.docs.first.reference;
        int currentQuantity = snapshot.docs.first.get('quantity') ?? 1;
        await docRef.update({'quantity': currentQuantity + cartModel.quantity});
        res = "Product quantity updated in cart";
      } else {
        await _firestore
            .collection(AppDefineCollection.APP_USER)
            .doc(userEmail)
            .collection(AppDefineCollection.APP_CART)
            .add(cartModel.toJson());
        res = "Product added to cart";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Stream<List<CartModel>> getCartStream() {
    return _firestore
        .collection(AppDefineCollection.APP_USER)
        .doc(userEmail)
        .collection(AppDefineCollection.APP_CART)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CartModel.fromJson(doc.data()))
            .toList());
  }

  Future<String> removeFromCart(String productId) async {
    String res = "Some error occurred";
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppDefineCollection.APP_USER)
          .doc(userEmail)
          .collection(AppDefineCollection.APP_CART)
          .where('productId', isEqualTo: productId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
        res = "Product removed from cart";
      } else {
        res = "Product not found in cart";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> clearCart() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppDefineCollection.APP_USER)
          .doc(userEmail)
          .collection(AppDefineCollection.APP_CART)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateQuantity(String productId, int newQuantity) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppDefineCollection.APP_USER)
          .doc(userEmail)
          .collection(AppDefineCollection.APP_CART)
          .where('productId', isEqualTo: productId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentReference docRef = snapshot.docs.first.reference;
        await docRef.update({'quantity': newQuantity});
      }
    } catch (e) {
      throw Exception('Failed to update quantity: ${e.toString()}');
    }
  }

  Future<void> updateCheckboxStatus(String productId, bool isChecked) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(AppDefineCollection.APP_USER)
          .doc(userEmail)
          .collection(AppDefineCollection.APP_CART)
          .where('productId', isEqualTo: productId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentReference docRef = snapshot.docs.first.reference;
        await docRef.update({'isChecked': isChecked});
      }
    } catch (e) {
      throw Exception('Failed to update checkbox status: ${e.toString()}');
    }
  }
}
