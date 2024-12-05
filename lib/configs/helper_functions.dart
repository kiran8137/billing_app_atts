


import 'dart:developer';
import 'dart:io';

import 'package:billing_app_atts/data/model/bill_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class HelperFunctions {

   Future<void> generatePdf(BillModel bill)async{
    
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context contex){
          return pw.Center(child: 
            pw.SizedBox(
                width: double.infinity,
                height: 500,
                child: pw.Padding(
                  padding:   pw.EdgeInsets.symmetric(horizontal: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Center(
                        child: pw.Text("Billed Successfully",
                        
                         
                        ),
                      ),
                      pw.SizedBox(height: 10),

                      pw.Container(
                        width: double.infinity,
                        height: 30,
                        decoration: pw.BoxDecoration(
                            
                            borderRadius: pw.BorderRadius.circular(8)),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'Name',
                              
                            ),
                            pw.Container(
                              //color: Colors.green,
                              width: 250,
                              child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceAround,
                                children: [
                                  pw.Text(
                                    "Qty",
                                     
                                  ),
                                  pw.Text(
                                    "Disc",
                                   
                                  ),
                                  pw.Text(
                                    "Amount",
                                    
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Expanded(
                        child: pw.ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => pw.Container(
                            width: double.infinity,
                            height: 50,
                            decoration: pw.BoxDecoration(
                               
                            ),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Row(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.SizedBox(
                                      width: 80,
                                      height: 20,
                                      child: pw.Text(
                                        bill.name.toString(),
                                        
                                        
                                    ),),
                                    pw.Container(
                                      //color: Colors.green,
                                      width: 250,
                                      child: pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceAround,
                                        children: [
                                          pw.Text(
                                            "1",
                                             
                                          ),
                                          pw.Text(
                                            "100",
                                            
                                          ),
                                          pw.Text(
                                             bill.totalAmount.toString(),
                                            
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                pw.Text(
                               bill.totalAmount.toString(),
                                
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      pw.Divider(
 
                        thickness: 0.6,
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              "Order Number",
                             
                            ),
                            pw.Text(
                               bill.ordreNo.toString(),
                              
                            )
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Padding(
                        padding: pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              "Bill Number",
                             
                            ),
                            pw.Text(
                               bill.billNo.toString(),
                              
                            )
                          ],
                        ),
                      ),
                     pw. SizedBox(height: 10),
                      pw.Text(
                        "payment summary",
                        // style: GoogleFonts.notoSans(
                        //     fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "Cash",
                      //         style: GoogleFonts.notoSans(fontSize: 15),
                      //       ),
                      //       Text(
                      //         state.bill.totalAmount.toString(),
                      //         style: GoogleFonts.notoSans(fontSize: 15),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // Text(
                      //   "Customer Info",
                      //   style: GoogleFonts.notoSans(
                      //       fontSize: 18, fontWeight: FontWeight.bold),
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       state.bill.name.toString(),
                      //       style: GoogleFonts.notoSans(
                      //           fontSize: 16, fontWeight: FontWeight.w500),
                      //     ),
                      //     Text(
                      //       "|",
                      //       style: GoogleFonts.notoSans(
                      //           fontSize: 15, fontWeight: FontWeight.w500),
                      //     ),
                      //     Text(
                      //         state.bill.mobileNumber.toString(),
                      //       style: GoogleFonts.notoSans(
                      //           fontSize: 15, fontWeight: FontWeight.w500),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 2,
                      //   child: Text(
                      //     "${state.bill.location}",
                      //     overflow: TextOverflow.ellipsis,
                      //     style: GoogleFonts.notoSans(
                      //         fontSize: 16, fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
          );
        }
        )
         
    );

    final directory  = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/example.pdf';
    final file = File(path);
    await file.writeAsBytes(
      await pdf.save()
    );
     debugPrint("saved");

    
    
   }
}