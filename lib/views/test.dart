import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/button.dart';
import '../widgets/default_textField.dart';
import '../widgets/transfer_bottom_sheet.dart';
import 'create_ticket.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key});

  @override
  _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  List<Map<String, dynamic>> ticketDetails = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Call the API to fetch ticket details
    fetchTicketDetails();
  }

  Future<void> fetchTicketDetails() async {
    try {
      final response = await http
          .get(Uri.parse('https://ticket-clone.up.railway.app/tickets'));

      if (response.statusCode == 200) {
        setState(() {
          // Explicitly cast the decoded JSON list to List<Map<String, dynamic>>
          ticketDetails =
              List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        print('Failed to load ticket details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching ticket details: $e');
    }
  }

  Future<Map<String, dynamic>> fetchTicketDetailsById(int id) async {
    try {
      final response = await http
          .get(Uri.parse('https://ticket-clone.up.railway.app/ticket/$id'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Failed to load ticket details: ${response.statusCode}');
        return {}; // Return an empty map or handle the error accordingly
      }
    } catch (e) {
      print('Error fetching ticket details: $e');
      return {}; // Return an empty map or handle the error accordingly
    }
  }

  void _showTransferBottomSheet(BuildContext context,
      List<Map<String, dynamic>> allTicketDetails, int selectedTicketIndex) {
    final Map<String, dynamic> selectedTicket =
        allTicketDetails[selectedTicketIndex];
    print("Transfer button tapped, showing bottom sheet");

    showModalBottomSheet(
      context: context,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      builder: (BuildContext context) {
        return TransferBottomSheet(
          selectedTicket: selectedTicket,
          onBack: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "My Tickets",
          style: TextStyle( color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear, // Cancel icon
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      body: ticketDetails.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: ticketDetails.length,
                    itemBuilder: (context, index, realIndex) {
                      return TicketCard(ticketDetails: ticketDetails[index]);
                    },
                    options: CarouselOptions(
                      height: 510,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ticketDetails.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 2.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.black
                              : Colors.grey.withOpacity(0.5),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, right: 30, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TmButton(
                          onPressed: () {
                            _showTransferBottomSheet(
                                context, ticketDetails, _currentIndex);
                          },
                          borderRadius: const Radius.circular(5),
                          buttonColor: Colors.blue,
                          buttonTitle: 'Transfer',
                          titleStyle: Colors.white,
                          height: 45,
                          width: 150,
                        ),
                        TmButton(
                          onPressed: () {
                          },
                          borderRadius: const Radius.circular(5),
                          buttonColor: Colors.blue,
                          buttonTitle: 'Sell',
                          titleStyle: Colors.white,
                          height: 45,
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final Map<String, dynamic> ticketDetails;

  const TicketCard({super.key, required this.ticketDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0), // Adjust the value as needed
                  topRight: Radius.circular(12.0), // Adjust the value as needed
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue, // Top color (light blue)
                    Color(0xff0e192a), // Bottom color (lighter shade of black)
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage(ticketDetails['imgname'] ??
                      'N/A'), // Replace with your image path
                  fit: BoxFit.scaleDown,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2)),
                ]),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 30,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes the position of the shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                              12.0), // Adjust the value as needed
                          topRight: Radius.circular(
                              12.0), // Adjust the value as needed
                        ),
                      ),
                      child: Text(
                        ticketDetails['tickettitle'] ?? 'N/A',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SEC', style: TextStyle(color: Colors.white)),
                          Text('ROW', style: TextStyle(color: Colors.white)),
                          Text('SEAT', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ticketDetails['section'] ?? 'N/A',
                              style: const TextStyle(color: Colors.white)),
                          Text(ticketDetails['roll'] ?? 'N/A',
                              style: const TextStyle(color: Colors.white)),
                          Text(ticketDetails['seat'] ?? 'N/A',
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(ticketDetails['tourtitle'] ?? 'N/A',
                        style: const TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: '${ticketDetails['showdate'] ?? 'N/A'}•',
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' Ticketmaster ${ticketDetails['venue'] ?? 'N/A'}',
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, //
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2)),
                ] // White color
                ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Enter at: ${ticketDetails['entrys'] ?? 'N/A'} '),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 220,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color(0xff1e2128)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.all(3),
                              child: Image.asset(
                                'assets/Apple_Wallet_Icon.svg.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Text(
                              'Add to Apple Wallet',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {}, child: const Text('View Barcode')),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Ticket Details')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 2)),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft:
                    Radius.circular(12.0), // Circular border radius bottom left
                bottomRight: Radius.circular(
                    12.0), // Circular border radius bottom right
              ),
              color: Colors.blue, // White color
            ),
          ),
        ],
      ),
    );
  }
}
