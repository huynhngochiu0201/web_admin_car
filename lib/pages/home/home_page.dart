import 'package:flutter/material.dart';
import 'package:web_admin_car/pages/home_page_main.dart';
import 'package:web_admin_car/pages/home/widget/side_menu.dart';
import 'package:web_admin_car/resources/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
              child: SideMenu(onMenuItemPressed: _onMenuItemPressed),
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
