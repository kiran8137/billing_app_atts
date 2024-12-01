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
              CommonTextField(
                suffixIcon: Icons.search,
                prefixIcon: Icons.clear,
                controller: searchController,
                onTap: () {
                  searchController.clear();
                },
              ),
              const SizedBox(height: 20),
              Expanded(child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is GetProductsEmptyState) {
                    return Center(
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
                             // HelperFunctions().addTotal(product.productprice, product.productId);
                             Provider.of<CartController>(context,listen: false).addTotal(int.parse(product.productprice), int.parse(product.discount!));
                             Provider.of<CartController>(context,listen: false).addSelectProduct(ProductModel(productId: product.productId, productName: product.productName, productprice: product.productprice));
                            },
                            onDoubleTap: (){
                               Provider.of<CartController>(context,listen: false).deduct(int.parse(product.productprice));
                            },
                            child: ListTile(
                             
                              
                                leading: const CircleAvatar(),
                                title: Text(
                                  product.productName,
                                  style: GoogleFonts.notoSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                  ),
                                ),
                                subtitle: Text(
                                  "₹ ${product.productprice}",
                                  style: GoogleFonts.notoSans(),
                                ),
                                minTileHeight: 70,
                                tileColor: Theme.of(context).colorScheme.tertiary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          );
                        },
                        separatorBuilder: (context, index) => CommonDivider(
                            color: Theme.of(context).colorScheme.secondary),
                        itemCount: state.products.length);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ))
            ],
          ),
        )),
      ),
      bottomNavigationBar: Consumer<CartController>(
        builder: (context, value, child) => 
        BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${value.total}',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              ButtonAppBar(
                title: 'Cart',
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => CartScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
