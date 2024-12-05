import 'package:billing_app_atts/configs/helper_functions.dart';
import 'package:billing_app_atts/data/model/product_model.dart';
import 'package:billing_app_atts/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:billing_app_atts/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:billing_app_atts/presentation/common_widgets/app_name.dart';
import 'package:billing_app_atts/presentation/common_widgets/button_app_bar.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_divider.dart';
import 'package:billing_app_atts/presentation/common_widgets/common_text_field.dart';
import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:billing_app_atts/presentation/screens/auth_screens/log_in_screen.dart';
import 'package:billing_app_atts/presentation/screens/cart_screen/cart_screen.dart';
import 'package:billing_app_atts/presentation/screens/home_screen/widgets_components/add_product_sheet.dart';
import 'package:billing_app_atts/presentation/widget/bottom_app_bar.dart';
import 'package:billing_app_atts/presentation/widget/products_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    debugPrint('build method triggered');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
            onTap: () {
              BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
            },
            child: const AppNameWidget()),
        actions: [
          //button used in appbar 
          ButtonAppBar(
            title: 'Add Product',
            onTap: () {
              addProductSheet(context);
            },
          ),
          const SizedBox(width: 10),
          GestureDetector(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
              },
              child: const Icon(Icons.person)),
          const SizedBox(width: 10)
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
                (Route<dynamic> predicate) => false);
          }
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              // // text form field
              // CommonTextField(
              //   suffixIcon: Icons.search,
              //   prefixIcon: Icons.clear,
              //   controller: searchController,
              //   onTap: () {
              //     searchController.clear();
              //   },
              // ),
              const SizedBox(height: 20),
              Expanded(child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is GetProductsEmptyState) {
                    return const Center(
                      child: Text("Products are empty"),
                    );
                  }
                  if (state is GetProductsSuccessState) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return GestureDetector(
                            onTap: (){
                              print(product.productName);
                             
                             //click to add to the cart 
                             Provider.of<CartController>(context,listen: false).addTotal(int.parse(product.productprice), int.parse(product.discount!));
                             Provider.of<CartController>(context,listen: false).addSelectProduct(ProductModel(productId: product.productId, productName: product.productName, productprice: product.productprice, discount: product.discount ?? "0"));
                            },
                            onDoubleTap: (){
                              //doubleclick to reduce or remove from the cart
                               Provider.of<CartController>(context,listen: false).deduct(int.parse(product.productprice));
                               Provider.of<CartController>(context,listen: false).removeSelectProduct(product.productId);
                            },
                            child: ProductsWidget(product: product), 
                          );
                        },
                        separatorBuilder: (context, index) => CommonDivider(
                            color: Theme.of(context).colorScheme.secondary),
                        itemCount: state.products.length);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ))
            ],
          ),
        )),
      ),
      bottomNavigationBar: const BottomAppbar(),
    );
  }
}

