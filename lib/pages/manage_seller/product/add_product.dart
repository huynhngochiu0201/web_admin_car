import 'package:flutter/material.dart';
import 'package:web_admin_car/components/button/cr_elevated_button.dart';
import 'package:web_admin_car/components/text_field/cr_text_field.dart';
import 'package:web_admin_car/resources/app_color.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({
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
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment
                                          //         .start,
                                          children: [
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Product name',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            const CrTextField(),
                                            const SizedBox(height: 25.0),
                                            const Row(
                                              children: [
                                                Text(
                                                  'Price',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                                SizedBox(width: 190),
                                                Text(
                                                  'Quantity',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10.0),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(child: CrTextField()),
                                                SizedBox(width: 20.0),
                                                Expanded(child: CrTextField()),
                                              ],
                                            ),
                                            const SizedBox(height: 25.0),
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Category',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            const CrTextField(),
                                            const SizedBox(height: 25.0),
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Description',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Container(
                                              width: 500,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: TextFormField(
                                                  maxLines:
                                                      10, // Cho phép nhập nhiều dòng
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Enter product title...',
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
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
          text: 'Add New Product',
          color: AppColor.blue,
          borderColor: AppColor.white,
        ),
      ],
    );
  }
}
