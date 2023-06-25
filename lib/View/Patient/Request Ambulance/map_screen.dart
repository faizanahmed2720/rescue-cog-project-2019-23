import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/src/Theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import '../../../src/Utils/CommonWidgets/UserFloatingactionButton.dart';

class MapScreen extends StatefulWidget {
  String? fullName;
  String? vehicleNo;
  String? vehicleType;
  String? profileImage;

  MapScreen({super.key, this.fullName,this.vehicleType,this.profileImage,this.vehicleNo});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Set<Marker> _markers = {};
  LatLng _initialCameraPosition = const LatLng(31.5204, 74.3587); // Lahore// LatLng


  Future<void> _launchPhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _addMarker(LatLng position, String title) {
    final Marker marker = Marker(
      markerId: MarkerId(title),
      position: position,
      infoWindow: InfoWindow(
        title: title,
      ),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void _addMarkers() {
    _addMarker(const LatLng(33.9930, 71.4402), 'Shaukat Khanum');
    _addMarker(const LatLng(31.4846, 74.2974), 'Jinnah Hospital');
    _addMarker(const LatLng(31.4797, 74.2804), 'Doctors Hospital');
    _addMarker(const LatLng(31.4846, 74.3974), 'National Hospital');
    _addMarker(const LatLng(31.5382, 74.3362), 'Punjab Institute of Cardiology');
    _addMarker(const LatLng(31.4756, 74.3377), 'Ittefaq Hospital');
    _addMarker(const LatLng(31.5753, 74.3798), 'Shalamar Hospital');
    _addMarker(const LatLng(31.5708, 74.3152), 'Mayo Hospital');
    _addMarker(const LatLng(31.5119, 74.3283), 'Hameed Latif Hospital');
    _addMarker(const LatLng(31.5127, 74.2996), 'Farooq Hospital');
    _addMarker(const LatLng(31.5356, 74.3273), 'Fatima Memorial Hospital');
    _addMarker(const LatLng(31.5380, 74.3513), 'Surgimed Hospital');
    _addMarker(const LatLng(31.3361, 74.1985), 'Sharif Medical City Hospital');
    _addMarker(const LatLng(31.5082, 74.3086), 'Sheikh Zayed Hospital');
  }

  @override
  void initState() {
    super.initState();
    _addMarkers();
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
            initialCameraPosition: CameraPosition(
              target: _initialCameraPosition,
              zoom: 12.0,
            ),
            markers: _markers,
            onTap: (latlang) {
              print("Hello");
            },
          ),
          Container(
            height: 270,
            // alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: primaryColor,
            ),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[700],
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: widget.profileImage == null || widget.profileImage!.isEmpty
                            ? const Center(child: Icon(Icons.person, size: 80, color: Colors.white))
                            : ClipOval(
                          child: Image.network(
                            widget.profileImage.toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(widget.fullName.toString(), style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          Text(widget.vehicleType.toString(), style: const TextStyle(color: thirdColor, fontSize: 20, fontWeight: FontWeight.bold),),
                          Text(widget.vehicleNo.toString() , style: const TextStyle(color: thirdColor, fontSize: 20, fontWeight: FontWeight.bold),),

                        ],
                      )
                    ],
                  ),

                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children:  [
                      Divider(color: Colors.white, thickness: 2,),
                      IconButton(
                          onPressed: () {
                            _launchPhoneCall('tel:+92 3201004367');
                          },
                          icon: Image.asset("assets/Images/callIcon.png", )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
