import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../View/Patient/Fire Brigades/fire_brigades_screen.dart';
import '../../../View/Patient/Request Ambulance/request_ambulance_screen.dart';
import '../../../View/Patient/User Dashboard/userDashoard_screen.dart';
import '../../../View/Patient/User Setting/user_setting.dart';

Widget CustomNavigationBar() {
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
                  Get.to(const userDashboard());
                },
                icon: Image.asset(
                  "assets/Images/Navigation Icons/home.png",
                  height: 26,
                  width: 26,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(UserLocation());
                },
                icon: Image.asset(
                  "assets/Images/Navigation Icons/ambulance.png",
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  Get.to(FireBrigades());
                },
                icon: Image.asset(
                  "assets/Images/Navigation Icons/fire brigades.png",
                  height: 26,
                  width: 26,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(const userSetting());
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
