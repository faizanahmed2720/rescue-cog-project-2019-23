import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class requestAmbulance extends StatefulWidget {
  const requestAmbulance({super.key});

  @override
  State<requestAmbulance> createState() => _requestAmbulanceState();
}

class _requestAmbulanceState extends State<requestAmbulance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is Ambulance Request Screen")),
    );
  }
}
