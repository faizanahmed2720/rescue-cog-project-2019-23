import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/src/Theme/colors.dart';
import 'package:untitled/src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import 'package:untitled/src/Utils/CommonWidgets/UserFloatingactionButton.dart';
import 'package:url_launcher/url_launcher.dart';

class FireBrigades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FIRE BRIGADE EMERGENCY SERVICE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FireBrigadesPage(),
    );
  }
}

class FireBrigadesPage extends StatefulWidget {
  @override
  _FireBrigadesPageState createState() => _FireBrigadesPageState();
}

class _FireBrigadesPageState extends State<FireBrigadesPage> {
  final Set<Marker> _markers = Set<Marker>();

  void _onMarkerTapped(MarkerId markerId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Branch Name'),
          content: Text(markerId.value),
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondaryColor),
                  onPressed: () {
                    _launchPhoneCall('tel:+92-42-99230418');
                    Navigator.of(context).pop();
                  },
                  child: const Text('Call',
                    style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }

  Future<void> _launchPhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  void initState() {
    super.initState();
    _addMarker(
        'Fire Brigade, G7MM+7RR, Band Rd, Tariq Colony, Sodiwal Gulshan-e-Ravi, Lahore, Punjab 54030',
        const LatLng(31.5332, 74.2144));
    _addMarker(
        'Fire Brigade Station, G9XF+JCV, Street No. 36, Saddar Town, Lahore, Punjab',
        const LatLng(31.5490, 74.3035));
    _addMarker(
        'Fire Brigade Station، Hospital Road, Scheme No. 2, Lahore, Punjab',
        const LatLng(31.5944, 74.2814));
    _addMarker(
        'Fire Brigade, F8GV+WF5, Lahore – Kasur Rd, Nishtar Town, Lahore, Punjab',
        const LatLng(31.4772, 74.2737));
    _addMarker(
        'Fire Brigade, Quaid-e-Azam Industrial Area, Kot Lakhpat Madar-e-Millat Road, Quaid-e-Azam Industrial Estate Quaid e Azam Industrial Estate, Lahore, Punjab',
        const LatLng(31.4408, 74.2523));
  }

  void _addMarker(String branchName, LatLng latLng) {
    _markers.add(
      Marker(
        markerId: MarkerId(branchName),
        position: latLng,
        onTap: () => _onMarkerTapped(MarkerId(branchName)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWithNotched(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(31.5490, 74.3035),
              zoom: 12.0,
            ),
            markers: _markers,
          ),
          Container(
            height: 200,
            alignment: Alignment.centerLeft,
            // width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: primaryColor,
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(80, 60, 20, 0),
              child: Text(
                "FIRE BRIGADES",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Direct Call',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  IconButton(
                      onPressed: () {
                        _launchPhoneCall('tel:+92 3201004367');
                      },
                      icon: Image.asset("assets/Images/callIcon.png")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
