import 'package:flutter/material.dart';
import 'package:web_admin_car/entities/models/category_model.dart';
import 'package:web_admin_car/gen/assets.gen.dart';
import 'package:web_admin_car/pages/auth/login_pages.dart';
import 'package:web_admin_car/pages/home_page_main.dart';
import 'package:web_admin_car/pages/home/widget/dashboard_list_tile.dart';
import 'package:web_admin_car/pages/manage_seller/category/category_page.dart';
import 'package:web_admin_car/pages/manage_seller/product/product.dart';
import 'package:web_admin_car/resources/app_color.dart';
import 'package:web_admin_car/services/auth_services.dart';
import 'package:web_admin_car/services/remote/category_service.dart';

class SideMenu extends StatefulWidget {
  final Function(Widget) onMenuItemPressed;
  final CategoryService categoryService;
  final CategoryModel categoryModel;

  const SideMenu({
    super.key,
    required this.onMenuItemPressed,
    required this.categoryService,
    required this.categoryModel,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final AuthService _authService = AuthService();
  // Tạo thể hiện của AuthService
  String? userName;
  Future<void> _logout(BuildContext context) async {
    await _authService.signOut();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => LoginPages(
                  categoryModel: widget.categoryModel,
                  categoryService: widget.categoryService,
                )),
      );
    }
  }

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
              widget.onMenuItemPressed(const HomePageMain());
            },
            svgAssetPath: Assets.icons.contentViewThumbnailsIcon,
          ),
          DashboardListTile(
            tiltle: 'Profile',
            onPress: () {
              widget
                  .onMenuItemPressed(const Center(child: Text("Profile Page")));
            },
            svgAssetPath: Assets.icons.registrationIcon,
          ),
          Product(onMenuItemPressed: widget.onMenuItemPressed, size: size),
          CategoryPage(
            onMenuItemPressed: widget.onMenuItemPressed,
            size: size,
            categoryService: widget.categoryService,
          ),
          DashboardListTile(
            tiltle: 'Order',
            onPress: () {
              widget.onMenuItemPressed(const Center(child: Text("Order Page")));
            },
            svgAssetPath: Assets.icons.fileLineIcon,
          ),
          DashboardListTile(
            tiltle: 'Settings',
            onPress: () {
              widget.onMenuItemPressed(
                  const Center(child: Text("Settings Page")));
            },
            svgAssetPath: Assets.icons.settingLineIcon,
          ),
          const Spacer(),
          DashboardListTile(
            tiltle: 'Logout',
            onPress: () => _logout(context), // Gọi hàm logout khi nhấn vào
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
