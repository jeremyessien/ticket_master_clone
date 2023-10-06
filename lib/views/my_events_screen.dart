import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ticket_master_clone/widgets/carousel_widget.dart';
import 'package:http/http.dart' as http;
import '../widgets/button.dart';
import '../widgets/default_textField.dart';
import '../widgets/transfer_bottom_sheet.dart';
import 'create_ticket.dart';


class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  List<Map<String, dynamic>> myTickets = []; // Update to a list of maps
  int _currentIndex = 0;

  Future<void> fetchTicketsFromBackend() async {
    final response = await http.get(Uri.parse('https://ticket-clone.up.railway.app/tickets'));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> tickets = List<Map<String, dynamic>>.from(json.decode(response.body));
      setState(() {
        myTickets = tickets;
      });
    } else {
      // Handle error appropriately
      print('Failed to fetch tickets. Status Code: ${response.statusCode}');
    }
  }
  // void _showTransferBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const ContinuousRectangleBorder(
  //       borderRadius: BorderRadius.zero,
  //     ),
  //     builder: (BuildContext context) {
  //       return ListView(
  //         padding: const EdgeInsets.all(12),
  //         children: [
  //           const Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.only(top: 5.0, bottom: 5),
  //                 child: Center(
  //                   child: Text(
  //                     'TRANSFER TICKETS',
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Divider(
  //                 indent: 0,
  //                 endIndent: 0,
  //               ),
  //               Text('2 Tickets Selected'),
  //               Row(
  //                 children: [
  //                   BottomSheetTicketRow(
  //                     descr: 'Sec',
  //                     amount: 347,
  //                   ),
  //                   BottomSheetTicketRow(
  //                     descr: 'Row',
  //                     amount: 20,
  //                   ),
  //                   BottomSheetTicketRow(
  //                     descr: 'Seat',
  //                     amount: 2627,
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 15,
  //               ),
  //               DefaultTextField(
  //                 title: 'First Name',
  //                 height: 45,
  //                 hintText: 'First Name',
  //               ),
  //               DefaultTextField(
  //                 title: 'Last Name',
  //                 height: 45,
  //                 hintText: 'Last Name',
  //               ),
  //               DefaultTextField(
  //                 title: 'Email or Mobile Number',
  //                 height: 45,
  //                 hintText: 'Email or Mobile Number',
  //               ),
  //               DefaultTextField(
  //                 title: 'Note',
  //                 // height: 45,
  //                 // hintText: '',
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Row(
  //                   children: [
  //                     Icon(
  //                       Icons.arrow_back_ios_outlined,
  //                       color: Colors.blue,
  //                       size: 18,
  //                     ),
  //                     Text(
  //                       'Back',
  //                       style: TextStyle(
  //                           color: Colors.blue,
  //                           fontWeight: FontWeight.w600,
  //                           fontSize: 16),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 height: 45,
  //                 width: 200,
  //                 alignment: Alignment.center,
  //                 decoration: BoxDecoration(
  //                   color: Colors.blue.shade500,
  //                   borderRadius: const BorderRadius.all(Radius.circular(10)),
  //                 ),
  //                 child: const Text(
  //                   'Transfer 2 Tickets',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Shane's post",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios, // Cancel icon
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        // padding: const EdgeInsets.only( left :12, right: 12, bottom: 10),
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear, // Cancel icon
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                        child: Text(
                      'My Tickets',
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                  // RichText(
                  //   text: TextSpan(
                  //     style: DefaultTextStyle.of(context).style,
                  //     children: [
                  //       TextSpan(
                  //         text: 'Ticketmaster Event\n',
                  //         style: GoogleFonts.alegreyaSans(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: 'Thu • Dec 31 • 10am - Ticketmaster Venue',
                  //         style: GoogleFonts.alegreyaSans(
                  //           color: Colors.white,
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: CarouselSlider.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  print('Index: $index, Length: ${myTickets.length}');
                  int selectedTicketId = myTickets.isNotEmpty ? myTickets[0]['id'] : 0;

                  return Column(
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: CarouselWidget(ticketId: selectedTicketId),
                      ),
                      const SizedBox(
                        height: 5, // Adjust the spacing as needed
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: myTickets.map((url) {
                          int index = myTickets.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.5),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  );
                },
                options: CarouselOptions(
                    height: 520,
                    viewportFraction: 0.91,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TmButton(
                    onPressed: () {
                      // _showTransferBottomSheet(context);
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TicketCreationScreen()),
                      );
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
            // CarouselSlider.builder(
            //     itemCount: myTickets.length,
            //     itemBuilder: (BuildContext context, int index, int realIndex) {
            //       return Column(
            //         children: [
            //           Container(
            //             width: double.maxFinite,
            //             decoration: const BoxDecoration(
            //                 color: Colors.blue,
            //                 borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(12),
            //                     topRight: Radius.circular(12))),
            //             child: Column(
            //               children: [
            //                 Container(
            //                   decoration: BoxDecoration(
            //                     color: Colors.blue.shade800,
            //                     borderRadius: const BorderRadius.only(
            //                       topLeft: Radius.circular(12),
            //                       topRight: Radius.circular(12),
            //                     ),
            //                   ),
            //                   alignment: Alignment.center,
            //                   padding: const EdgeInsets.all(8),
            //                   width: double.maxFinite,
            //                   child: const Text(
            //                     'Individual 1',
            //                     style: TextStyle(color: Colors.white),
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                   height: 10,
            //                 ),
            //                 const Padding(
            //                   padding: EdgeInsets.only(left: 15.0, right: 15),
            //                   child: Column(
            //                     children: [
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text('SEC',
            //                               style: TextStyle(color: Colors.white)),
            //                           Text('ROW',
            //                               style: TextStyle(color: Colors.white)),
            //                           Text('SEAT',
            //                               style: TextStyle(color: Colors.white)),
            //                         ],
            //                       ),
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text('347',
            //                               style: TextStyle(color: Colors.white)),
            //                           Text('20',
            //                               style: TextStyle(color: Colors.white)),
            //                           Text(
            //                             '260',
            //                             style: TextStyle(color: Colors.white),
            //                           ),
            //                         ],
            //                       ),
            //                       Text('Ticket Master Event',
            //                           style: TextStyle(color: Colors.white)),
            //                       Text('Thu Dec 21 10am - Ticketmaster Venue',
            //                           style: TextStyle(color: Colors.white))
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Container(
            //             decoration: const BoxDecoration(
            //               color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(12),
            //       topRight: Radius.circular(12))),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 const Text('Enter at: West Gate'),
            //                 GestureDetector(
            //                   child: Container(
            //                     height: 45,
            //                     width: 100,
            //                     decoration: const BoxDecoration(
            //                       color: Colors.blue,
            //                       borderRadius: BorderRadius.all(Radius.circular(10)),
            //                     ),
            //                     child: const Row(
            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                       children: [
            //
            //                         Icon(Icons.check_circle_outline, color: Colors.white,),
            //                         Text('View in Wallet'),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //
            //               ],
            //             ),
            //             ),
            //         ],
            //       );
            //     },
            //     options: CarouselOptions(
            //       viewportFraction: 1.0,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           _currentIndex = index;
            //         });
            //       },
            //     )),
            // ElevatedButton(
            //   onPressed: () {
            //     _showTransferBottomSheet(context);
            //   },
            //   child: const Text('Transfer'),
            // )
          ],
        ),
      )),
    );
  }
}
