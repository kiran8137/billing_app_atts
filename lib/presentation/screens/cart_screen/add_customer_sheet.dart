

import 'package:billing_app_atts/configs/helper_models.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_sub_heading_text.dart';
import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:billing_app_atts/presentation/widget/text_fields_with_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<dynamic> addCustomerSheet(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController placeController = TextEditingController(); 
  final  cartProvider = Provider.of<CartController>(context,listen: false);
  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) =>  
                Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 60 / 100,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                            TextFieldWithName(
                          title: 'Name',
                          textController: nameController,
                        ),
                  
                        TextFieldWithName(
                          title: 'Number',
                          textController: numberController,
                        ),
                  
                        TextFieldWithName(
                          title: 'Place',
                          textController: placeController,
                        ),



                         GestureDetector(
                          onTap: (){
                              if(nameController.text.isNotEmpty && numberController.text.isNotEmpty && placeController.text.isNotEmpty){
                                cartProvider.addSelectedAddress(AddressModel(name: nameController.text, number: numberController.text, place: placeController.text));
                            nameController.clear();
                            numberController.clear();
                            placeController.clear();
                          
                            Navigator.pop(context);
                          }else{
                            return;
                          }
                          },
                           child: Container(
                            margin: EdgeInsets.only(top: 100),
                            width: double.infinity,
                            height: 40,
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
                         ),
                        ],
                      ),
                ),
                ),
              );
  
            }
          
