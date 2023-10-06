import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'default_textField.dart';

class TransferBottomSheet extends StatelessWidget {
  final Map<String, dynamic> selectedTicket;
  final VoidCallback onBack;

  const TransferBottomSheet({
    required this.selectedTicket,
    required this.onBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.only(top: 2.0, bottom: 2),
              child: Center(
                child: Text(
                  'TRANSFER TICKETS',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
            ),
            const Text('2 Tickets Selected'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                       TextSpan(
                        text: 'SEC: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp, // Adjust the font size as needed
                        ),
                      ),
                      TextSpan(
                        text: '${selectedTicket['section']}',
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  width: 10.w,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                       TextSpan(
                        text: 'Row: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp, // Adjust the font size as needed
                        ),
                      ),
                      TextSpan(
                        text: '${selectedTicket['roll']}',
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  width: 10.w,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                       TextSpan(
                        text: 'Seat: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp, // Adjust the font size as needed
                        ),
                      ),
                      TextSpan(
                        text: '${selectedTicket['seat']}',
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp, // Adjust the font size as needed
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  width: 10.w,
                ),
              ],
            ),
             SizedBox(
              height: 15.h,
            ),
             DefaultTextField(
              title: 'First Name',
              height: 45.h,
              hintText: 'First Name',
            ),
             DefaultTextField(
              title: 'Last Name',
              height: 45.h,
              hintText: 'Last Name',
            ),
             DefaultTextField(
              title: 'Email or Mobile Number',
              height: 45.h,
              hintText: 'Email or Mobile Number',
            ),
            const DefaultTextField(
              title: 'Note',
              // height: 45,
              // hintText: '',
            ),
            // Display the ticket details
            // Add more fields as needed
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onBack,
              child:  Row(
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
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 45.h,
              width: 200.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const Text(
                'Transfer Tickets',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }
}
