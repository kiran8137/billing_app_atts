import 'package:billing_app_atts/data/model/bill_model.dart';
import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:billing_app_atts/presentation/bloc/bill_bloc/bill_bloc.dart';
import 'package:billing_app_atts/presentation/common_widgets/app_name.dart';
import 'package:billing_app_atts/presentation/common_widgets/button_app_bar.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_divider.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_sub_heading_text.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_text_field.dart';
import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:billing_app_atts/presentation/screens/bill_screen/bill_screen.dart';
import 'package:billing_app_atts/presentation/screens/cart_screen/add_customer_sheet.dart';
import 'package:billing_app_atts/presentation/widget/address_widget.dart';
import 'package:billing_app_atts/presentation/widget/amount_detail_dialog_cart.dart';
import 'package:billing_app_atts/presentation/widget/bottom_app_bar_cart.dart';
import 'package:billing_app_atts/presentation/widget/cart_item_widget.dart';
import 'package:billing_app_atts/presentation/widget/payment_mode_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cartProvider = Provider.of<CartController>(context);
    final TextEditingController amountController =
        TextEditingController(text: cartProvider.total.toString());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const AppNameWidget(),
        actions: [
          ButtonAppBar(
            title: 'Add Customer',
            onTap: () {
              addCustomerSheet(context);
            },
          ),
          const SizedBox(width: 10)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        //  color: Colors.red,
        height: 120,
        child: Column(
          children: [

            BottomBarCart(width: width, cartProvider: cartProvider), // widget which displays the total
            const SizedBox(height: 5),
            SizedBox(
                width: double.infinity,
                height: 35,
                // color: Colors.green,
                child: cartProvider.selectedAddress != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PaymentModeWidget(
                            title: 'Cash',
                            onTap: () {
                              amountDetailDialog(context, cartProvider, amountController);
                            },
                          ),
                          PaymentModeWidget(title: "Credit Card"),
                          PaymentModeWidget(title: "UPI")
                        ],
                      )
                    : const Center(
                        child: const Text("Select Address to continue")))
          ],
        ),
      ),
      body: BlocListener<BillBloc, BillState>(
        listener: (context, state) {
          if(state is CreateBillSuccessState){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=> BillScreen(billId: state.billId,)));
          }
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: CommonSubHeadingText(title: 'Cart')),
              CommonDivider(
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(height: 10),
              const CommonSubHeadingText(title: 'Customer Info'),
              Consumer<CartController>(
                  builder: (context, value, child) =>
                      value.selectedAddress != null
                          ? AddressWiget(value: value,)
                          : const SizedBox()),
              CommonDivider(color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 10),
              const CommonSubHeadingText(title: "Items"),
              Expanded(
                  child: Consumer<CartController>(
                builder: (context, value, child) => ListView.separated(
                    itemBuilder: (context, index) {
                      final cart = cartProvider.selectedProduct.toList()[index];
                      return CartItemWidget(cart: cart, width: width);
                    },
                    separatorBuilder: (context, index) => CommonDivider(
                        color: Theme.of(context).colorScheme.secondary),
                    itemCount: value.selectedProduct.length),
              )),
            ],
          ),
        )),
      ),
    );
  }

  
}

