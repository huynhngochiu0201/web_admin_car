// import 'package:flutter/material.dart';
// import 'package:web_admin_car/components/button/cr_elevated_button.dart';
// import 'package:web_admin_car/components/text_field/cr_text_field.dart';
// import 'package:web_admin_car/resources/app_color.dart';

// class AddCategory extends StatelessWidget {
//   AddCategory({
//     super.key,
//     required this.size,
//   });

//   final Size size;
//   final nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         CrElevatedButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Center(child: Text('Add New Product')),
//                   content: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Container(
//                             width: 800,
//                             height: size.height,
//                             decoration: const BoxDecoration(),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     flex: 6,
//                                     child: Container(
//                                       decoration: const BoxDecoration(),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20.0),
//                                         child: Column(
//                                           children: [
//                                             const Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                 'Category',
//                                                 style: TextStyle(
//                                                     fontSize: 18.0,
//                                                     fontWeight:
//                                                         FontWeight.w100),
//                                               ),
//                                             ),
//                                             const SizedBox(height: 10.0),
//                                             CrTextField(
//                                               controller: nameController,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     )),
//                                 Expanded(
//                                     flex: 4,
//                                     child: Column(
//                                       children: [
//                                         const Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10.0),
//                                           child: Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                 'Image',
//                                                 style: TextStyle(
//                                                     fontSize: 18.6,
//                                                     fontWeight:
//                                                         FontWeight.w300),
//                                               )),
//                                         ),
//                                         const SizedBox(height: 10),
//                                         GestureDetector(
//                                           onTap: () {},
//                                           child: Container(
//                                             width: 300,
//                                             height: 300,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         20.0)),
//                                             child: const Icon(
//                                               Icons.add_a_photo_outlined,
//                                               size: 100,
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ))
//                               ],
//                             )),
//                       ],
//                     ),
//                   ),
//                   actions: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CrElevatedButton(
//                           text: 'Cancel',
//                           borderColor: Colors.white,
//                           color: Colors.blue,
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         const SizedBox(width: 20.0),
//                         CrElevatedButton(
//                           text: 'Submit',
//                           borderColor: Colors.white,
//                           color: Colors.blue,
//                           onPressed: () {},
//                         )
//                       ],
//                     )
//                   ],
//                 );
//               },
//             );
//           },
//           text: 'Add Category',
//           color: AppColor.blue,
//           borderColor: AppColor.white,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:web_admin_car/components/button/cr_elevated_button.dart';
import 'package:web_admin_car/components/text_field/cr_text_field.dart';
import 'package:web_admin_car/entities/models/category_model.dart';
import 'package:web_admin_car/resources/app_color.dart';
import 'package:web_admin_car/services/remote/category_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class AddCategory extends StatefulWidget {
  final Size size;
  final CategoryService categoryService;

  const AddCategory({
    super.key,
    required this.size,
    required this.categoryService,
  });

  @override
  AddCategoryState createState() => AddCategoryState();
}

class AddCategoryState extends State<AddCategory> {
  final nameController = TextEditingController();
  Uint8List? _imageData;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageData = await pickedFile.readAsBytes(); // Use readAsBytes here
      setState(() {
        _imageData = imageData;
      });
    }
  }

  Future<void> _submitForm() async {
    if (nameController.text.isNotEmpty && _imageData != null) {
      final newCategory = CategoryModel(
        id: '', // This will be set by the service
        name: nameController.text,
        image: _imageData!,
      );

      try {
        await widget.categoryService.addNewCategory(newCategory);
        Navigator.of(context).pop(); // Close the dialog
      } catch (e) {
        // Handle the error, e.g., show a snackbar or dialog
      }
    } else {
      // Handle the form validation error, e.g., show a snackbar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CrElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Center(child: Text('Add New Product')),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 800,
                          height: widget.size.height,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Category',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      CrTextField(
                                        controller: nameController,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Image',
                                          style: TextStyle(
                                            fontSize: 18.6,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: _pickImage,
                                      child: Container(
                                        width: 300,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: _imageData == null
                                            ? const Icon(
                                                Icons.add_a_photo_outlined,
                                                size: 100,
                                              )
                                            : Image.memory(_imageData!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CrElevatedButton(
                          text: 'Cancel',
                          borderColor: Colors.white,
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(width: 20.0),
                        CrElevatedButton(
                          text: 'Submit',
                          borderColor: Colors.white,
                          color: Colors.blue,
                          onPressed: _submitForm,
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          text: 'Add Category',
          color: AppColor.blue,
          borderColor: AppColor.white,
        ),
      ],
    );
  }
}
