import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/default_textField.dart';
import '../widgets/transfer_bottom_sheet.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  final List<String> myTickets = ['Doja Cat', 'Travis Scott', "Guns N' Roses"];
  int _currentIndex = 0;

  void _showTransferBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      builder: (BuildContext context) {
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Center(
                    child: Text(
                      'TRANSFER TICKETS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 0,
                  endIndent: 0,
                ),
                Text('2 Tickets Selected'),
                Row(
                  children: [
                    BottomSheetTicketRow(
                      descr: 'Sec',
                      amount: 347,
                    ),
                    BottomSheetTicketRow(
                      descr: 'Row',
                      amount: 20,
                    ),
                    BottomSheetTicketRow(
                      descr: 'Seat',
                      amount: 2627,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                DefaultTextField(
                  title: 'First Name',
                  height: 45,
                  hintText: 'First Name',
                ),
                DefaultTextField(
                  title: 'Last Name',
                  height: 45,
                  hintText: 'Last Name',
                ),
                DefaultTextField(
                  title: 'Email or Mobile Number',
                  height: 45,
                  hintText: 'Email or Mobile Number',
                ),
                DefaultTextField(
                  title: 'Note',
                  // height: 45,
                  // hintText: '',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.blue,
                        size: 18,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade500,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                    'Transfer 2 Tickets',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tickets',
          style: GoogleFonts.alegreyaSans(),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel_sharp)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: myTickets.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.shade800,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          width: double.maxFinite,
                          child: const Text(
                            'Individual 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('SEC',
                                      style: TextStyle(color: Colors.white)),
                                  Text('ROW',
                                      style: TextStyle(color: Colors.white)),
                                  Text('SEAT',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('347',
                                      style: TextStyle(color: Colors.white)),
                                  Text('20',
                                      style: TextStyle(color: Colors.white)),
                                  Text(
                                    '260',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showTransferBottomSheet(context);
                          },
                          child: const Text('Transfer'),
                        )
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ))
          ],
        ),
      )),
    );
  }
}
