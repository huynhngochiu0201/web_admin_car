// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // SignUp User
//   Future<String> signupUser({
//     required String email,
//     required String password,
//     required String name,
//   }) async {
//     String res = "Some error Occurred";
//     try {
//       if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
//         // Register user in auth with email and password
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         // Add user to your Firestore database with id field
//         String userId = cred.user!.uid;
//         await _firestore.collection("users").doc(userId).set({
//           'name': name,
//           'uid': userId,
//           'email': email,
//           // 'id': userId, // Adding the user id explicitly
//         });

//         res = "success";
//       }
//     } catch (err) {
//       return err.toString();
//     }
//     return res;
//   }

//   // logIn user
//   Future<String> loginUser({
//     required String email,
//     required String password,
//   }) async {
//     String res = "Some error Occurred";
//     try {
//       if (email.isNotEmpty && password.isNotEmpty) {
//         // Logging in user with email and password
//         await _auth.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         res = "success";
//       } else {
//         res = "Please enter all the fields";
//       }
//     } catch (err) {
//       return err.toString();
//     }
//     return res;
//   }

//   // Send password reset email
//   Future<String> sendPasswordReset(String email) async {
//     String res = "Some error Occurred";
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//       res = "success";
//     } catch (e) {
//       res = e.toString();
//     }
//     return res;
//   }

//   // sign out
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }

//   Future<Map<String, dynamic>?> getUserInfo(String userEmail) async {
//     try {
//       DocumentSnapshot userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userEmail)
//           .get();

//       if (userDoc.exists) {
//         return userDoc.data() as Map<String, dynamic>;
//       } else {
//         print('User not found');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching user info: $e');
//       return null;
//     }
//   }
// }
