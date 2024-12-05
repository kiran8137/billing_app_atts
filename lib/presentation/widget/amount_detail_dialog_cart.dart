import 'package:billing_app_atts/data/model/bill_model.dart';
import 'package:billing_app_atts/presentation/bloc/bill_bloc/bill_bloc.dart';
import 'package:billing_app_atts/presentation/common_widgets/button_app_bar.dart';
import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> amountDetailDialog(BuildContext context, CartController cartProvider, TextEditingController amountController) {
    return showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              35 /
                                              100,
                                      // width:  MediaQuery.of(context).size.height*90/100,

                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary)),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total Amount",
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "₹${cartProvider.total}",
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total Amount",
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                    child: Container(
                                                  height: 40,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: TextFormField(
                                                      onChanged: (value) {
                                                        cartProvider
                                                            .calculateStillRemainingAmt(
                                                                cartProvider
                                                                    .total
                                                                    .toString(),
                                                                amountController
                                                                    .text);
                                                      },
                                                      controller:
                                                          amountController,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              prefixIcon:
                                                                  Icon(
                                                                Icons.clear,
                                                                color: Colors
                                                                    .grey,
                                                              ))),
                                                ))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Still remaining",
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "₹${cartProvider.remainingAmount}",
                                                  style: GoogleFonts.notoSans(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ButtonAppBar(
                                                  title: 'Proceed',
                                                  onTap: () {
                                                    if (amountController
                                                        .text.isNotEmpty) {
                                                      BillModel bill = BillModel(
                                                          productIds:  cartProvider.selectedProduct.toList().map((item)=> item.productId).toList(),
                                                           name: cartProvider.selectedAddress!.name,
                                                           mobileNumber: cartProvider.selectedAddress!.number,
                                                           location: cartProvider.selectedAddress!.place,
                                                          paymentMode: "cash",
                                                          totalAmount:
                                                              cartProvider
                                                                  .total
                                                                  .toString());
                                                      BlocProvider.of<
                                                                  BillBloc>(
                                                              context)
                                                          .add(
                                                              CreateBillEvent(
                                                                  bill:
                                                                      bill));
                                                      Navigator.pop(context);
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                ),
                                                ButtonAppBar(
                                                  title: 'cancel',
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
  }