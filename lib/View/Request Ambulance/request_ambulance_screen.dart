import 'package:flutter/material.dart';

class RequestAmbulance extends StatefulWidget {
  const RequestAmbulance({super.key});

  @override
  State<RequestAmbulance> createState() => _RequestAmbulanceState();
}

class _RequestAmbulanceState extends State<RequestAmbulance> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("This is Ambulance Request Screen")),
    );
  }
}
