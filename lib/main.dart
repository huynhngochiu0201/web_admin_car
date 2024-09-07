import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_admin_car/firebase_options.dart';
import 'package:web_admin_car/pages/auth/login_pages.dart';
import 'package:web_admin_car/services/remote/category_service.dart';

void main() async {
  // Uint8List
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));

  // Create an instance of CategoryService
  final categoryService = CategoryService();

  runApp(MyApp(categoryService: categoryService));
}

class MyApp extends StatelessWidget {
  final CategoryService categoryService;

  const MyApp({super.key, required this.categoryService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPages(
        categoryService: categoryService,
      ),
    );
  }
}
