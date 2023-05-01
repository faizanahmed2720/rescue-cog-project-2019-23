import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Disease1 extends StatelessWidget {
  const Disease1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Scaffold(
        body: Center(child: Text("COVID-19")),
      ),
    );
  }
}
