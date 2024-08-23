import 'package:flutter/material.dart';
import 'package:web_admin_car/gen/assets.gen.dart';
import 'package:web_admin_car/pages/home/widget/dashboard_list_tile.dart';
import 'package:web_admin_car/pages/manage_seller/product/add_product.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.onMenuItemPressed,
    required this.size,
  });

  final Function(Widget p1) onMenuItemPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return DashboardListTile(
      tiltle: 'Product',
      onPress: () {
        onMenuItemPressed(
          Center(
            child: Column(
              children: [
                AddProduct(size: size),
                const Divider(),
                const Expanded(child: Column())
              ],
            ),
          ),
        );
      },
      svgAssetPath: Assets.icons.boxPackageIcon,
    );
  }
}
