import 'package:flutter/material.dart';
import 'package:ticket_master_clone/views/test.dart';

import 'create_ticket.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return const TicketCreationScreen();
  }
}
