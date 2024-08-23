import 'package:flutter/material.dart';
import 'package:web_admin_car/components/button/cr_elevated_button.dart';
import 'package:web_admin_car/components/text_field/cr_text_field.dart';
import 'package:web_admin_car/components/text_field/cr_text_field_password.dart';
import 'package:web_admin_car/resources/app_color.dart';
import 'package:web_admin_car/services/auth_services.dart';
import 'package:web_admin_car/utils/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final AuthService authMethod = AuthService(); // Initialize AuthService

  void signUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      String res = await authMethod.signupUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );

      setState(() {
        isLoading = false;
      });

      if (res == "success") {
        // Navigate to another page or show success message
        Navigator.of(context)
            .pushReplacementNamed('/home'); // Adjust route as needed
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res)),
        );
      }
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
                                bottomLeft: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          height: 500,
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Column(
                                children: [
                                  const Text(
                                    'Register',
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
                                      controller: nameController,
                                      focusNode: nameFocus,
                                      hintText: 'Full Name',
                                      prefixIcon: const Icon(Icons.person,
                                          color: AppColor.grey),
                                      textInputAction: TextInputAction.next,
                                      validator: Validator.required,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: CrTextField(
                                      controller: emailController,
                                      hintText: 'Email',
                                      prefixIcon: const Icon(Icons.email,
                                          color: AppColor.grey),
                                      textInputAction: TextInputAction.next,
                                      validator: Validator.email,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: CrTextFieldPassword(
                                      controller: passwordController,
                                      hintText: 'Password',
                                      textInputAction: TextInputAction.next,
                                      validator: Validator.password,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: CrTextFieldPassword(
                                      controller: confirmPasswordController,
                                      onChanged: (_) => setState(() {}),
                                      hintText: 'Confirm Password',
                                      textInputAction: TextInputAction.done,
                                      validator: Validator.confirmPassword(
                                          passwordController.text),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: CrElevatedButton(
                                      onPressed: signUp,
                                      color: AppColor.blue,
                                      borderColor: AppColor.white,
                                      text:
                                          isLoading ? 'Loading...' : 'Register',
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
