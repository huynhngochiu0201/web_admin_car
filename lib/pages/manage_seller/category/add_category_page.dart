import 'package:flutter/material.dart';
import 'package:web_admin_car/components/button/cr_elevated_button.dart';
import 'package:web_admin_car/components/text_field/cr_text_field.dart';
import 'package:web_admin_car/resources/app_color.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({
    super.key,
    required this.size,
  });

  final Size size;

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
                        Container(
                            width: 800,
                            height: size.height,
                            decoration: const BoxDecoration(),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 6,
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Category',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            CrTextField(),
                                          ],
                                        ),
                                      ),
                                    )),
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
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          width: 300,
                                          height: 300,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: const Icon(
                                            Icons.add_a_photo_outlined,
                                            size: 100,
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            )),
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
                          onPressed: () {},
                        )
                      ],
                    )
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
