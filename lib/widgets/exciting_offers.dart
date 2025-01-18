// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointx/data/store_offers.dart';

class ExcitingOffers extends StatelessWidget {
  const ExcitingOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Text(
            'Exciting Offers',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.04,
          ),
          child: Column(
            children: storeOffers
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * .05),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.20),
                          end: Alignment(0, 1),
                          colors: [Color(0xFF614FA8), Color(0xFF161F38)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.network(
                                      e["logoUrl"],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e["offer"],
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    e["companyName"],
                                    style: GoogleFonts.poppins(
                                      color: Colors.white
                                          .withOpacity(0.6499999761581421),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            e["points"],
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFA3DDC9),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
