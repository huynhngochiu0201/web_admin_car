import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:web_admin_car/resources/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.leftPressed,
      this.rightPressed,
      required this.title,
      this.avatar,
      this.color = AppColor.white});

  final VoidCallback? leftPressed;
  final VoidCallback? rightPressed;
  final String title;
  final String? avatar;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(
          top: MediaQuery.of(context).padding.top + 6.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Transform.rotate(
              angle: 45 * math.pi / 180,
              child: Container(
                margin: const EdgeInsets.all(8.6),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.shadow,
                      offset: Offset(3.0, 3.0),
                      blurRadius: 4.6,
                    ),
                  ],
                ),
                child: Transform.rotate(
                    angle: -45 * math.pi / 180,
                    child: const Icon(Icons.arrow_back,
                        size: 22.0, color: AppColor.brown)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(title, style: const TextStyle(fontSize: 20.0))),
          ),
          const Spacer(),
          GestureDetector(onTap: () {}, child: const Icon(Icons.search))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
