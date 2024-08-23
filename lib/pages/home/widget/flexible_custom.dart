import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_admin_car/resources/app_color.dart';

class FlexibleCustom extends StatelessWidget {
  const FlexibleCustom({
    super.key,
    this.title,
    this.title1,
    this.svgAssetPath,
  });

  final String? title;
  final String? title1;
  final String? svgAssetPath;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    svgAssetPath ?? '',
                    color: AppColor.black,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      fontSize: 26.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                title1 ?? '',
                style: const TextStyle(
                  fontSize: 26.0,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
