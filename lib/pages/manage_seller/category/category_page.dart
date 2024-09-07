// // import 'package:flutter/material.dart';
// // import 'package:web_admin_car/gen/assets.gen.dart';
// // import 'package:web_admin_car/pages/home/widget/dashboard_list_tile.dart';
// // import 'package:web_admin_car/pages/manage_seller/category/add_category_page.dart';

// // class CategoryPage extends StatelessWidget {
// //   const CategoryPage({
// //     super.key,
// //     required this.onMenuItemPressed,
// //     required this.size,
// //   });

// //   final Function(Widget p1) onMenuItemPressed;
// //   final Size size;

// //   @override
// //   Widget build(BuildContext context) {
// //     return DashboardListTile(
// //       tiltle: 'Category',
// //       onPress: () {
// //         onMenuItemPressed(
// //           Center(
// //             child: Column(
// //               children: [
// //                 AddCategory(
// //                   size: size,
// //                 ),
// //                 const SizedBox(height: 10.0),
// //                 const Divider(),
// //                 const SizedBox(height: 10.0),
// //                 Expanded(
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(10.0),
// //                     child: ListView.separated(
// //                         itemBuilder: (context, index) {
// //                           return Row(
// //                             children: [
// //                               Container(
// //                                 height: 200.0,
// //                                 width: 200.0,
// //                                 decoration: BoxDecoration(
// //                                     color: Colors.blue,
// //                                     borderRadius: BorderRadius.circular(10.0)),
// //                                 child: Image.asset('name'),
// //                               ),
// //                               const SizedBox(width: 20.0),
// //                               const Text('Names')
// //                             ],
// //                           );
// //                         },
// //                         separatorBuilder: (context, index) {
// //                           return const SizedBox(
// //                             height: 40.0,
// //                             child: Divider(
// //                               color: Colors.grey,
// //                               thickness: 1.0,
// //                             ),
// //                           );
// //                         },
// //                         itemCount: 10),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //       svgAssetPath: Assets.icons.categoryIcon,
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:web_admin_car/gen/assets.gen.dart';
import 'package:web_admin_car/pages/home/widget/dashboard_list_tile.dart';
import 'package:web_admin_car/pages/manage_seller/category/add_category_page.dart';
import 'package:web_admin_car/services/remote/category_service.dart';

class CategoryPage extends StatelessWidget {
  final Function(Widget p1) onMenuItemPressed;
  final Size size;
  final CategoryService categoryService;

  const CategoryPage({
    super.key,
    required this.onMenuItemPressed,
    required this.size,
    required this.categoryService,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardListTile(
      tiltle: 'Category',
      onPress: () {
        onMenuItemPressed(
          Center(
            child: Column(
              children: [
                AddCategory(
                  size: size,
                  categoryService: categoryService,
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                const SizedBox(height: 10.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              height: 200.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.asset('name'),
                            ),
                            const SizedBox(width: 20.0),
                            const Text('Names'),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 40.0,
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1.0,
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      svgAssetPath: Assets.icons.categoryIcon,
    );
  }
}
