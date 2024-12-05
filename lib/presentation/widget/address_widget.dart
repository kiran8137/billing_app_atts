

import 'package:billing_app_atts/presentation/provider/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressWiget extends StatelessWidget {
  const AddressWiget({
    super.key, required this.value,
  });
final CartController value;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: double.infinity,
        //color: Colors.green,
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 30,
                  width: 250,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 125,
                        //height: 30,
                        child: Text(
                          value.selectedAddress!.name,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Text("|"),
                      Text(
                        value.selectedAddress!.number,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 60,
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary,
                      ),
                      Icon(
                        Icons.clear,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              value.selectedAddress!.place,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary),
            )
          ],
        ),
      );
  }
}

