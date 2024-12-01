import 'package:billing_app_atts/presentation/common_widgets/app_name.dart';
import 'package:billing_app_atts/presentation/common_widgets/button_app_bar.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_divider.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_sub_heading_text.dart';
import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // Provider.of<CartController>(context,listen: false).getSelectProduct();
   final cartProvider = Provider.of<CartController>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const AppNameWidget(),
        actions: const [
          ButtonAppBar(title: 'Add Customer'),
          SizedBox(width: 10)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        
      //  color: Colors.red,
        height: 120,
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.infinity,
             // color: Colors.grey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //color: Colors.green,
                    width: 200,
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Total',
                        style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23,
                                ),
                        ),
                        
                        Text('(item:3 , Quantity:4)')
                      ],
                    ),
                  ),

                   Text('& 1200.00',
                        style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23,
                                ),
                        ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 35,
             // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 80,
                     decoration: BoxDecoration(
                       color: Theme.of(context).colorScheme.secondary,
                       borderRadius: BorderRadius.circular(5)
                     ),
                     child: Center(
                      child: Text('Cash',
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 100,
                     decoration: BoxDecoration(
                       color: Theme.of(context).colorScheme.secondary,
                       borderRadius: BorderRadius.circular(5)
                     ),
                    child: Center(
                      child: Text('Credit Card',
                       style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                  Container(
                      height: 30,
                    width: 80,
                      decoration: BoxDecoration(
                       color: Theme.of(context).colorScheme.secondary,
                       borderRadius: BorderRadius.circular(5)
                     ),
                     child: Center(
                      child: Text('UPI',
                       style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CommonSubHeadingText(title: 'Cart')),
            CommonDivider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 10),
            CommonSubHeadingText(title: 'Customer Info'),
            Container(
              height: 60,
              width: double.infinity,
              //color: Colors.green,
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 125,
                              //height: 30,
                              child: Text(
                                'Mr Kiran Kannan kiran kannan',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Text("|"),
                            Text(
                              '8137918511',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        // color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            Icon(
                              Icons.clear,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kiran Nivas, Mettupalayam, Kollengode - 678506',
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            CommonDivider(color: Theme.of(context).colorScheme.secondary),
            SizedBox(height: 10),
            CommonSubHeadingText(title: "Items"),
            Expanded(
                child: Consumer<CartController>(
                  builder: (context, value, child) => 
                   ListView.separated(
                    
                      itemBuilder: (context, index) {
                        final cart = cartProvider.selectedProduct.toList()[index];
                        return Container(
                          height: 90,
                          width: double.infinity,
                          //color: Colors.green,
                          color: Theme.of(context).colorScheme.secondary,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                  
                                    width: 320,
                                    // color: Colors.green,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cart.productName,
                                          style: GoogleFonts.notoSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                          ),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                "x",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary),
                                              ),
                                              Text(
                                                "1",
                                                style: GoogleFonts.notoSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "₹ ${cart.productprice}",
                                          style: GoogleFonts.notoSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                height: 50,
                                // width: 250,
                  
                                child: Container(
                                  //color: Colors.green,
                                  // width: 125,
                                  height: 60,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '& 280.00',
                                            style: GoogleFonts.notoSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text("|"),
                                          Text(
                                            'IGST18',
                                            style: GoogleFonts.notoSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text("|"),
                                          Text(
                                            'SKU: ABCHW1787992',
                                            style: GoogleFonts.notoSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Disc 10%',
                                        style: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => CommonDivider(
                          color: Theme.of(context).colorScheme.secondary),
                      itemCount: value.selectedProduct.length
                      ),
                )
                    ),
                   
          ],
        ),
      )
      ),
    );
  }
}
