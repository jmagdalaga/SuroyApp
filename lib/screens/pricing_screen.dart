import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suroyapp/screens/vehicle_info.dart';
import 'package:flutter/services.dart';

class PriceRegistration extends StatefulWidget {
  final VehicleInformation3 vehicleInfo;

  const PriceRegistration({Key? key, required this.vehicleInfo})
      : super(key: key);

  @override
  State<PriceRegistration> createState() => _PriceRegistrationState();
}

class _PriceRegistrationState extends State<PriceRegistration> {
  TextEditingController price = TextEditingController();
  String rentPrice = "";
  int serviceFee = 0;
  String strServiceFee = "";
  int totalPrice = 0;
  String strTotalPrice = "";

  @override
  Widget build(BuildContext context) {
    // Update strServiceFee and totalPrice here in the build method
    strServiceFee = serviceFee.toString();
    strTotalPrice = totalPrice.toString();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "SET THE PRICE FOR YOUR VEHICLE!",
                style: GoogleFonts.poppins(
                    fontSize: 26, fontWeight: FontWeight.w600),
              ),
              Text(
                "This will be the base price before incurred additional charges and fees",
                style: GoogleFonts.poppins(
                    fontSize: 14, color: Colors.grey.shade500),
              ),
              SizedBox(height: 110),
              TextField(
                textAlign: TextAlign.center,
                controller: price,
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: price.text.isEmpty ? "₱0" : null,
                  labelStyle: TextStyle(fontSize: 45, color: Colors.black),
                  border: InputBorder.none, // Remove the border
                ),
                textAlignVertical: TextAlignVertical.center,
                style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.bold), // Set the font size
                onChanged: (value) {
                  // Format the input with a peso sign
                  int numericPrice = int.tryParse(value) ?? 0;
                  serviceFee = (numericPrice * 0.15).toInt();
                  totalPrice = (numericPrice + serviceFee).toInt();
                  price.text = 'P' + '$value';
                  // Rebuild the widget to update the label text visibility
                  setState(() {
                    rentPrice = value;
                  });
                },
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(width: 3.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Base Price",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "P" + "$rentPrice",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Service Fee",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "P" + "$strServiceFee",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Price before taxes",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "P" + "$strTotalPrice",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    strServiceFee = "0";
    strTotalPrice = "0";
  }

  @override
  void dispose() {
    price.dispose();
    super.dispose();
  }
}