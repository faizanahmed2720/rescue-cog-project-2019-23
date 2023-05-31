// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Driver/Driver%20Setting/driver_setting.dart';

import '../Driver Dashboard/driver_dashboard.dart';


Widget driverCustomBottomNavigationBar() {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  return BottomAppBar(
    shape: const CircularNotchedRectangleWithCorners(),
    notchMargin: 0.05,
    clipBehavior: Clip.antiAlias,
    child: SizedBox(
      height: kBottomNavigationBarHeight * 0.98,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(const driverDashboard());
                },
                icon: Image.asset(
                  "assets/Images/Navigation Icons/home.png",
                  height: 26,
                  width: 26,
                ),
              ),

              const SizedBox(
                width: 15,
              ),

              IconButton(
                onPressed: () {
                  Get.to(const driverSetting());
                },
                icon: Image.asset(
                  "assets/Images/Navigation Icons/setting.png",
                  height: 26,
                  width: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CircularNotchedRectangleWithCorners implements NotchedShape {
  const CircularNotchedRectangleWithCorners();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final Path path = Path();
    path.addRRect(
      RRect.fromRectAndCorners(
        host,
        topLeft: const Radius.circular(30.0),
        topRight: const Radius.circular(30.0),
      ),
    );
    if (guest != null && !guest.isEmpty) {
      path.addRRect(
        RRect.fromRectAndCorners(
          guest,
          topLeft: const Radius.circular(30.0),
          topRight: const Radius.circular(30.0),
        ),
      );
    }
    return path;
  }
}
