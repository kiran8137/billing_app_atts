import 'dart:io';

import 'package:billing_app_atts/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_sub_heading_text.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_text_field.dart';
import 'package:billing_app_atts/presentation/screens/home_screen/widgets_components/text_fields_with_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> addProductSheet(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  File? image;
  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) => BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              if(state is AddProductSuccessState){
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added Successfully")));
                nameController.clear();
                priceController.clear();
              }
              if(state is AddProductErrorState){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Can't able to add product. please try again")));
              }
            },
            builder: (context, state) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 80 / 100,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.arrow_back_ios)),
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  final selectedimage = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  image = File(selectedimage!.path);
                                  debugPrint(selectedimage!.path);
                                },
                                child: image != null
                                    ? Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            // color: Theme.of(context).colorScheme.secondary,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Image.file(image!))
                                    : Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )),
                            CommonSubHeadingText(title: 'Add Image')
                          ],
                        ),
                      ),
                      TextFieldWithName(
                        title: 'Product Name',
                        textController: nameController,
                      ),
                      SizedBox(height: 10),
                      TextFieldWithName(
                        title: 'Product Price',
                        textController: priceController,
                      ),
                       SizedBox(height: 10),
                      TextFieldWithName(title: 'Discount if', textController: discountController),
                      GestureDetector(
                        onTap: (){
                          if(priceController.text.isNotEmpty && priceController.text.isNotEmpty){
                             BlocProvider.of<ProductBloc>(context).add(AddProductEvent(productName: nameController.text, productPrice: priceController.text));
                            nameController.clear();
                            priceController.clear();
                            discountController.clear();
                            BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
                            Navigator.pop(context);
                          }else{
                            return;
                          }
                         
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 120),
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "Add Product",
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ));
}
