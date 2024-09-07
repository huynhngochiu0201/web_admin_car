import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_admin_car/constants/define_collection.dart';
import 'package:web_admin_car/entities/models/payment_model.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PaymentModel>> getPayment() async {
    try {
      final paymentsCollection = await _firestore
          .collection(AppDefineCollection.APP_PAYMENT)
          .orderBy('createdAt', descending: true)
          .get();
      return paymentsCollection.docs
          .map((doc) => PaymentModel.fromJson(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching payments: $e');
    }
  }

  Future<void> deletePaymentById(String paymentId) async {
    try {
      await _firestore
          .collection(AppDefineCollection.APP_PAYMENT)
          .doc(paymentId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
