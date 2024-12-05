import 'dart:io';

import 'package:billing_app_atts/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_sub_heading_text.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_text_field.dart';
import 'package:billing_app_atts/presentation/widget/add_product_button.dart';
import 'package:billing_app_atts/presentation/widget/text_fields_with_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> addProductSheet(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
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
                height:  width<400  ? height*50 : height * 60 / 100,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      
                      TextFieldWithName(
                        title: 'Product Name',
                        textController: nameController,
                      ),
                     SizedBox(height: 15),
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
                        child: AddProductButton(height: height),
                      )
                    ],
                  ),
                ),
              );
            },
          ));
}

