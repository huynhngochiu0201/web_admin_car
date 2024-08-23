import 'package:flutter/material.dart';
import 'package:web_admin_car/gen/assets.gen.dart';
import 'package:web_admin_car/pages/home/widget/dashboard_list_tile.dart';
import 'package:web_admin_car/pages/manage_seller/category/add_category_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
    required this.onMenuItemPressed,
    required this.size,
  });

  final Function(Widget p1) onMenuItemPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return DashboardListTile(
      tiltle: 'Category',
      onPress: () {
        onMenuItemPressed(
          Center(
            child: Column(
              children: [
                AddCategory(size: size),
                const Divider(),
                const Expanded(child: Column())
              ],
            ),
          ),
        );
      },
      svgAssetPath: Assets.icons.categoryIcon,
    );
  }
}
