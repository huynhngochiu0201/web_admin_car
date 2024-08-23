import 'package:flutter/material.dart';
import 'package:web_admin_car/gen/assets.gen.dart';
import 'package:web_admin_car/pages/home_page_main.dart';
import 'package:web_admin_car/pages/home/widget/dashboard_list_tile.dart';
import 'package:web_admin_car/pages/manage_seller/category/category_page.dart';
import 'package:web_admin_car/pages/manage_seller/product/product.dart';
import 'package:web_admin_car/resources/app_color.dart';

class SideMenu extends StatelessWidget {
  final Function(Widget) onMenuItemPressed;

  const SideMenu({
    super.key,
    required this.onMenuItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const double defaultPadding = 16.0;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding * 3),
      decoration: const BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          const AvataAndTitle(defaultPadding: defaultPadding),
          const SizedBox(height: defaultPadding),
          DashboardListTile(
            tiltle: 'Home',
            onPress: () {
              onMenuItemPressed(const HomePageMain());
            },
            svgAssetPath: Assets.icons.contentViewThumbnailsIcon,
          ),
          DashboardListTile(
            tiltle: 'Profile',
            onPress: () {
              onMenuItemPressed(const Center(child: Text("Profile Page")));
            },
            svgAssetPath: Assets.icons.registrationIcon,
          ),
          Product(onMenuItemPressed: onMenuItemPressed, size: size),
          CategoryPage(onMenuItemPressed: onMenuItemPressed, size: size),
          DashboardListTile(
            tiltle: 'Order',
            onPress: () {
              onMenuItemPressed(const Center(child: Text("Order Page")));
            },
            svgAssetPath: Assets.icons.fileLineIcon,
          ),
          DashboardListTile(
            tiltle: 'Settings',
            onPress: () {
              onMenuItemPressed(const Center(child: Text("Settings Page")));
            },
            svgAssetPath: Assets.icons.settingLineIcon,
          ),
          const Spacer(),
          DashboardListTile(
            tiltle: 'Logout',
            onPress: () {
              onMenuItemPressed(const Center(child: Text("Logout Page")));
            },
            svgAssetPath: Assets.icons.logoutLineIcon,
          ),
        ],
      ),
    );
  }
}

class AvataAndTitle extends StatelessWidget {
  const AvataAndTitle({
    super.key,
    required this.defaultPadding,
  });

  final double defaultPadding;

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    return SizedBox(
      height: 80.0,
      child: DrawerHeader(
        padding: const EdgeInsets.only(left: defaultPadding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset('assets/images/Autocarlogo.png'),
                ),
                const SizedBox(width: 5.0),
                const Text(
                  'data',
                  style: TextStyle(color: AppColor.white),
                ),
              ],
            ),
            const Text(
              'Main Menu',
              style: TextStyle(color: AppColor.white),
            )
          ],
        ),
      ),
    );
  }
}
