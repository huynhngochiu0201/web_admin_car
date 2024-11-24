import 'package:flutter/material.dart';

import 'package:web_admin_car/pages/home_page_main.dart';
import 'package:web_admin_car/resources/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Widget _currentContent = const Center(child: HomePageMain());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45.withOpacity(0.1),
      body: Container(
        padding: EdgeInsets.all(AppColor.defaultPadding * 1.5),
        child: Row(
          children: [
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
