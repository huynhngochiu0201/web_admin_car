import 'package:flutter/material.dart';
import 'package:web_admin_car/components/button/cr_elevated_button.dart';
import 'package:web_admin_car/components/snack_bar/show_snack_bar.dart';
import 'package:web_admin_car/components/text_field/cr_text_field.dart';
import 'package:web_admin_car/components/text_field/cr_text_field_password.dart';
import 'package:web_admin_car/entities/models/category_model.dart';
import 'package:web_admin_car/pages/home/home_page.dart';
import 'package:web_admin_car/resources/app_color.dart';
import 'package:web_admin_car/services/auth_services.dart';
import 'package:web_admin_car/services/remote/category_service.dart';
import 'package:web_admin_car/utils/validator.dart';

class LoginPages extends StatefulWidget {
  final CategoryService categoryService;
  final CategoryModel? categoryModel;
  const LoginPages(
      {super.key, required this.categoryService, this.categoryModel});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final AuthService authMethod = AuthService(); // Initialize AuthService

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    String res = await AuthService().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            categoryModel: widget.categoryModel ??
                CategoryModel(id: '1', name: '', image: ''),
            categoryService: widget.categoryService,
          ),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFe6e2fd),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 250, vertical: 150),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          height: 500,
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Column(
                                children: [
                                  const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                      "Welcome to car rescue's management page"),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: CrTextField(
                                      controller: emailController,
                                      hintText: 'Email or Phone',
                                      prefixIcon: const Icon(Icons.email,
                                          color: Colors.orange),
                                      validator: Validator.email,
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: CrTextFieldPassword(
                                      controller: passwordController,
                                      hintText: 'Password',
                                      validator: Validator.password,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: CrElevatedButton(
                                      onPressed: loginUser,
                                      color: AppColor.blue,
                                      borderColor: AppColor.white,
                                      text: isLoading ? 'Loading...' : 'Login',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              colors: [
                                Color(0xFF5038ED),
                                Color(0xFF9181F4),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          height: 500,
                          width: size.width,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  'assets/images/Rectangle.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: Positioned(
                                  child: Image.asset(
                                    'assets/images/Autocarlogo.png',
                                    width: 450,
                                    height: 450,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
