// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:web_admin_car/gen/assets.gen.dart';
// import 'package:web_admin_car/resources/app_color.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isExpanded = false;
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           _navigationRail(),
//           _centerCustom(),
//         ],
//       ),
//     );
//   }

//   Expanded _centerCustom() {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isExpanded = !isExpanded;
//                       });
//                     },
//                     icon: const Icon(Icons.menu),
//                   ),
//                   const CircleAvatar(
//                     backgroundImage: NetworkImage(''),
//                     radius: 26.0,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               _cardCustom(),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               Row(
//                 children: [
//                   const SizedBox(
//                     width: 300.0,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Type Article Title",
//                         prefixIcon: Icon(Icons.search),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black26,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   DropdownButton(
//                       hint: const Text("Filter by"),
//                       items: const [
//                         DropdownMenuItem(
//                           value: "Date",
//                           child: Text("Date"),
//                         ),
//                         DropdownMenuItem(
//                           value: "Comments",
//                           child: Text("Comments"),
//                         ),
//                         DropdownMenuItem(
//                           value: "Views",
//                           child: Text("Views"),
//                         ),
//                       ],
//                       onChanged: (value) {}),
//                   const SizedBox(
//                     width: 20.0,
//                   ),
//                   DropdownButton(
//                       hint: const Text("Order by"),
//                       items: const [
//                         DropdownMenuItem(
//                           value: "Date",
//                           child: Text("Date"),
//                         ),
//                         DropdownMenuItem(
//                           value: "Comments",
//                           child: Text("Comments"),
//                         ),
//                         DropdownMenuItem(
//                           value: "Views",
//                           child: Text("Views"),
//                         ),
//                       ],
//                       onChanged: (value) {}),
//                 ],
//               ),
//               const SizedBox(
//                 height: 40.0,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   DataTable(
//                       headingRowColor: WidgetStateProperty.resolveWith(
//                           (states) => Colors.grey.shade200),
//                       columns: const [
//                         DataColumn(label: Text("ID")),
//                         DataColumn(label: Text("Article Title")),
//                         DataColumn(label: Text("Creation Date")),
//                         DataColumn(label: Text("Views")),
//                         DataColumn(label: Text("Comments")),
//                       ],
//                       rows: [
//                         DataRow(cells: [
//                           const DataCell(Text("0")),
//                           const DataCell(
//                               Text("How to build a Flutter Web App")),
//                           DataCell(Text("${DateTime.now()}")),
//                           const DataCell(Text("2.3K Views")),
//                           const DataCell(Text("102Comments")),
//                         ]),
//                         DataRow(cells: [
//                           const DataCell(Text("1")),
//                           const DataCell(
//                               Text("How to build a Flutter Mobile App")),
//                           DataCell(Text("${DateTime.now()}")),
//                           const DataCell(Text("21.3K Views")),
//                           const DataCell(Text("1020Comments")),
//                         ]),
//                         DataRow(cells: [
//                           const DataCell(Text("2")),
//                           const DataCell(
//                               Text("Flutter for your first project")),
//                           DataCell(Text("${DateTime.now()}")),
//                           const DataCell(Text("2.3M Views")),
//                           const DataCell(Text("10K Comments")),
//                         ]),
//                       ]),
//                   const SizedBox(
//                     height: 40.0,
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "1",
//                           style: TextStyle(color: Colors.deepPurple),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "2",
//                           style: TextStyle(color: Colors.deepPurple),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "3",
//                           style: TextStyle(color: Colors.deepPurple),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "See All",
//                           style: TextStyle(color: Colors.deepPurple),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row _cardCustom() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         const Flexible(
//           child: Card(
//             child: Padding(
//               padding: EdgeInsets.all(18.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.article,
//                         size: 30.0,
//                       ),
//                       SizedBox(
//                         width: 15.0,
//                       ),
//                       Text(
//                         "Order",
//                         style: TextStyle(
//                           fontSize: 26.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     "",
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Flexible(
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       SvgPicture.asset(
//                         Assets.icons.boxPackageIcon,
//                         color: AppColor.black,
//                         width: 30,
//                         height: 30,
//                       ),
//                       const SizedBox(
//                         width: 15.0,
//                       ),
//                       const Text(
//                         "Total Sale",
//                         style: TextStyle(
//                           fontSize: 26.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   const Text(
//                     "",
//                     style: TextStyle(
//                       fontSize: 26.0,
//                       color: Colors.amber,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const Flexible(
//           child: Card(
//             child: Padding(
//               padding: EdgeInsets.all(18.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.monetization_on_outlined,
//                         size: 30.0,
//                         color: Colors.black,
//                       ),
//                       SizedBox(
//                         width: 15.0,
//                       ),
//                       Text(
//                         "Total Product",
//                         style: TextStyle(
//                           fontSize: 26.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     "",
//                     style: TextStyle(
//                       fontSize: 26,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   NavigationRail _navigationRail() {
//     return NavigationRail(
//       extended: isExpanded,
//       backgroundColor: Colors.deepPurple.shade400,
//       unselectedIconTheme: const IconThemeData(color: Colors.white, opacity: 1),
//       unselectedLabelTextStyle: const TextStyle(
//         color: Colors.white,
//       ),
//       selectedIconTheme: IconThemeData(color: Colors.deepPurple.shade900),
//       destinations: [
//         const NavigationRailDestination(
//           icon: Icon(Icons.home),
//           label: Text("Home"),
//         ),
//         const NavigationRailDestination(
//           icon: Icon(Icons.person),
//           label: Text("Profile"),
//         ),
//         NavigationRailDestination(
//           icon: SvgPicture.asset(
//             Assets.icons.categoryIcon,
//             color: AppColor.white,
//             width: 20,
//             height: 20,
//           ),
//           label: const Text("Category"),
//         ),
//         NavigationRailDestination(
//           icon: SvgPicture.asset(
//             Assets.icons.boxPackageIcon,
//             color: AppColor.white,
//             width: 20,
//             height: 20,
//           ),
//           label: const Text("Order"),
//         ),
//         const NavigationRailDestination(
//           icon: Icon(Icons.settings),
//           label: Text("Settings"),
//         ),
//         const NavigationRailDestination(
//           icon: Icon(Icons.logout),
//           label: Text("Logout"),
//         ),
//       ],
//       selectedIndex: selectedIndex,
//       onDestinationSelected: (index) {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//     );
//   }
//
///////////////////////////////////////////////////////////////
library;

//library;

// import 'package:flutter/material.dart';
// import 'package:web_admin_car/pages/home/widget/side_menu.dart';
// import 'package:web_admin_car/resources/app_color.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: Colors.black45.withOpacity(0.1),
//       body: Container(
//         padding: EdgeInsets.all(AppColor.defaultPadding * 1.5),
//         decoration: const BoxDecoration(),
//         child: const Row(
//           children: [
//             Expanded(flex: 2, child: SideMenu()),
//             Expanded(
//               flex: 10,
//               child: Column(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:web_admin_car/home_page_main.dart';
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
    // Size size = MediaQuery.of(context).size;

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
