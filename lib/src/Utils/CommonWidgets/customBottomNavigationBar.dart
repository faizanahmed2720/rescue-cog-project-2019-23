import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/src/Constants/text_strings.dart';
import '../../../View/User Dashboard/userDashoard_screen.dart';
import '../../Constants/colors.dart';
import '../../constants/image_strings.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': userDashboard(),
      },
      {
        'page': userDashboard(),
      },
      {
        'page': userDashboard(),
      },
      {
        'page': userDashboard(),
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
        shape: CircularNotchedRectangleWithCorners(),
        notchMargin: 0.05,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
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
                    icon:
                        Image.asset("assets\Images\Navigation Icons\home.png"),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Image.asset(
                      "assets\Images\Navigation Icons\ambulance.png"),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                        "assets\Images\Navigation Icons\fire brigades.png"),
                    label: ''),
                BottomNavigationBarItem(
                  icon:
                      Image.asset("assets\Images\Navigation Icons\setting.png"),
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
          child: Image.asset("assets\Images\Navigation Icons\profile.png"),
          onPressed: () => setState(() {}),
        ),
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
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    );
    if (guest != null && !guest.isEmpty) {
      path.addRRect(
        RRect.fromRectAndCorners(
          guest,
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      );
    }
    return path;
  }
}
