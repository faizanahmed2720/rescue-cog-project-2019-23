// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../View/Fire Brigades/fire_brigades_screen.dart';
import '../../../View/Request Ambulance/request_ambulance_screen.dart';
import '../../../View/User Account Setting/user_account_setting.dart';
import '../../../View/User Dashboard/userDashoard_screen.dart';
import '../../../View/User Profile/user_profile.dart';
import '../../Constants/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const userDashboard(),
      },
      {
        'page': const RequestAmbulance(),
      },
      {
        'page': const fireBrigades(),
      },
      {
        'page': const UserAccountSetting(),
      },
      {
        'page': const userProfile(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangleWithCorners(),
        notchMargin: 0.05,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.0),
                topRight: Radius.circular(60.0),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Image.asset(
                        "assets/Images/Navigation Icons/home.png",
                        height: 26,
                        width: 26,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Image.asset(
                      "assets/Images/Navigation Icons/ambulance.png",
                      height: 26,
                      width: 26,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Image.asset(
                        "assets/Images/Navigation Icons/fire brigades.png",
                        height: 26,
                        width: 26,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset(
                      "assets/Images/Navigation Icons/setting.png",
                      height: 26,
                      width: 26,
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            backgroundColor: primaryColor,
            hoverElevation: 10,
            foregroundColor: Colors.black54,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "assets/Images/Navigation Icons/profile.png",
                height: 26,
                width: 26,
              ),
            ),
            onPressed: () {
              Get.to(const userProfile());
            }),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Map<String, Object>>('_pages', _pages));
  }
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
