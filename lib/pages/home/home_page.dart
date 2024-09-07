import 'package:flutter/material.dart';
import 'package:web_admin_car/entities/models/category_model.dart';
import 'package:web_admin_car/pages/home_page_main.dart';
import 'package:web_admin_car/pages/home/widget/side_menu.dart';
import 'package:web_admin_car/resources/app_color.dart';
import 'package:web_admin_car/services/remote/category_service.dart';

class HomePage extends StatefulWidget {
  final CategoryService categoryService;
  final CategoryModel categoryModel;
  const HomePage(
      {super.key, required this.categoryService, required this.categoryModel});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget _currentContent = const Center(child: HomePageMain());

  void _onMenuItemPressed(Widget content) {
    setState(() {
      _currentContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45.withOpacity(0.1),
      body: Container(
        padding: EdgeInsets.all(AppColor.defaultPadding * 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SideMenu(
                categoryModel: widget.categoryModel,
                onMenuItemPressed: _onMenuItemPressed,
                categoryService: widget.categoryService,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 10,
              child: _currentContent,
            )
          ],
        ),
      ),
    );
  }
}
