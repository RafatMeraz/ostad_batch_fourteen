import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GoogleMap(
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onTap: (LatLng latLng) {
          print('Clicked on $latLng');
        },
        onLongPress: (LatLng latLng) {
          print('Long pressed on $latLng');
        },
        trafficEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.79934197566539, 90.37194515283755),
          zoom: 16
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onCameraIdle: () {
          print('Dancing animation');
        },
        onCameraMove: (CameraPosition movingPosition) {
          print(movingPosition.target);
        },
        onCameraMoveStarted: () {
          print('Hide Dancing Animation');
        },
        mapType: .terrain,
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
