import 'package:billing_app_atts/configs/helper_functions.dart';
import 'package:billing_app_atts/data/model/bill_model.dart';
import 'package:billing_app_atts/presentation/bloc/bill_bloc/bill_bloc.dart';
import 'package:billing_app_atts/presentation/common_widgets/button_app_bar.dart';
import 'package:billing_app_atts/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key, required this.billId});

  final String billId;

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
   BillModel? billModel;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BillBloc>(context).add(GetBillDetailEvent(billId: widget.billId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ButtonAppBar(
            title: "Home",
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (Route<dynamic> route) => false);
            },
            )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: ()async{
            await HelperFunctions().generatePdf(billModel!);
          },
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text("Print"),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<BillBloc, BillState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              
              if(state is GetBillErrorState){
                return Center(child: Text("something went wrong"),);
              }
              if(state is GetBillDetailsSuccess){
                billModel = BillModel(
                  billNo: state.bill.billNo,
                  ordreNo: state.bill.ordreNo,
                  name: state.bill.name,
                  mobileNumber: state.bill.mobileNumber,
                  location: state.bill.location,
                  paymentMode: state.bill.paymentMode,
                  totalAmount: state.bill.totalAmount
                );
                return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 70 / 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("Billed Successfully",
                        
                        style: GoogleFonts.notoSans(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 88, 205, 92)
                        ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: GoogleFonts.notoSans(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              //color: Colors.green,
                              width: 250,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Qty",
                                    style: GoogleFonts.notoSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Disc",
                                    style: GoogleFonts.notoSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Amount",
                                    style: GoogleFonts.notoSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      height: 20,
                                      child: Text(
                                        state.bill.name.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.notoSans(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      //color: Colors.green,
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "1",
                                            style: GoogleFonts.notoSans(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "100",
                                            style: GoogleFonts.notoSans(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            state.bill.totalAmount.toString(),
                                            style: GoogleFonts.notoSans(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                state.bill.totalAmount.toString(),
                                  style: GoogleFonts.notoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.onSecondary,
                        thickness: 0.6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Number",
                              style: GoogleFonts.notoSans(fontSize: 15),
                            ),
                            Text(
                              state.bill.ordreNo.toString(),
                              style: GoogleFonts.notoSans(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bill Number",
                              style: GoogleFonts.notoSans(fontSize: 15),
                            ),
                            Text(
                              state.bill.billNo.toString(),
                              style: GoogleFonts.notoSans(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "payment summary",
                        style: GoogleFonts.notoSans(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cash",
                              style: GoogleFonts.notoSans(fontSize: 15),
                            ),
                            Text(
                              state.bill.totalAmount.toString(),
                              style: GoogleFonts.notoSans(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Customer Info",
                        style: GoogleFonts.notoSans(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            state.bill.name.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "|",
                            style: GoogleFonts.notoSans(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                              state.bill.mobileNumber.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "${state.bill.location}",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.notoSans(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              }else{
                return Center(child: CircularProgressIndicator());
              }
              
            },
          ),
        ),
      ),
    );
  }
}
