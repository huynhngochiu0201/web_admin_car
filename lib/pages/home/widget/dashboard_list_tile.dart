import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_admin_car/resources/app_color.dart';

class DashboardListTile extends StatelessWidget {
  const DashboardListTile({
    super.key,
    this.tiltle,
    this.icon,
    this.onPress,
    this.svgAssetPath,
    this.borderColor = Colors.grey,
    this.hoverColor = Colors.blue,
  });

  final String? tiltle;

  final Icon? icon;
  final VoidCallback? onPress;
  final String? svgAssetPath;
  final Color borderColor;
  final Color hoverColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPress,
        hoverColor: hoverColor,
        splashColor: borderColor,
        borderRadius: BorderRadius.circular(20.0),
        child: ListTile(
          visualDensity: const VisualDensity(vertical: 0),
          dense: true,
          //onTap: onPress,
          leading: SvgPicture.asset(
            svgAssetPath ?? '',
            color: AppColor.white,
            width: 20,
            height: 20,
          ),
          title: Text(
            tiltle ?? '',
            style: const TextStyle(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
