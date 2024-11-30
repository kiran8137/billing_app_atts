import 'package:billing_app_atts/presentation/common_widgets/common_text_field.dart';
import 'package:billing_app_atts/presentation/screens/home_screen/widgets_components/text_fields_with_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> addProductSheet(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
    return showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: false,
              context: context, 
              builder: (context)=>
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*70/100,
                decoration: BoxDecoration(
                   color: Theme.of(context).colorScheme.surface,
                   borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SizedBox(width: double.infinity,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.arrow_back_ios)),
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              
                            ),
                            Text('Add Image',
                            style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSecondary
                            ),
                            )
                          ],
                        ),
                      ),
                  
                        TextFieldWithName(title: 'Product Name', textController: nameController,),
                       SizedBox(height: 10),
                        TextFieldWithName(title: 'Product Price',textController: priceController,),
                      
                      Container(
                        margin: EdgeInsets.only(top: 120),
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(child: Text("Add Product",
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                        )),
                      )
                    ],
                  ),
                ),
              )
              );
  }

