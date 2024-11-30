

import 'package:billing_app_atts/presentation/common_widgets/common_text_field.dart';
import 'package:billing_app_atts/presentation/screens/home_screen/widgets_components/add_product_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title:   Text('Bills',
        style: GoogleFonts.ptSans(
          fontWeight: FontWeight.bold
        )
        ),
        actions: [
          
          GestureDetector(
            onTap: (){
               addProductSheet(context);
            },
            child: Container(
              width: 140,
              height: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(
                  'Add Product',
                   style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w500
                   ),
                
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
       
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CommonTextField(
                suffixIcon: Icons.search,
                prefixIcon: Icons.clear,
                controller: searchController,
                onTap: (){
                  searchController.clear();
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder:(context, index) {
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text('food name',
                      style:  GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                 ),
                     ),
                     subtitle: Text('product price',
                     style: GoogleFonts.notoSans(),
                     ),
                      minTileHeight: 70,
                      tileColor:  Theme.of(context).colorScheme.tertiary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    );
                  }, 
                  separatorBuilder: (context , index)=> Divider(color: Theme.of(context).colorScheme.secondary), 
                  itemCount: 5)
                )
            ],
          ),
        )
        ),
    );
  }

  
}

