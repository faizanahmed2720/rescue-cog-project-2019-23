import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class fireBrigades extends StatefulWidget {
  const fireBrigades({super.key});

  @override
  State<fireBrigades> createState() => _fireBrigadesState();
}

class _fireBrigadesState extends State<fireBrigades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Center(child: Text("This is Fire Brigades Screen")),
    );
  }
}
