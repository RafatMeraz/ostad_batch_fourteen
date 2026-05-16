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
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onCameraIdle: () {
          print('Dancing animation');
        },
        onCameraMove: (CameraPosition movingPosition) {
          // print(movingPosition.target);
        },
        onCameraMoveStarted: () {
          print('Hide Dancing Animation');
        },
        mapType: .normal,
        markers: <Marker>{
          Marker(
            markerId: MarkerId('home'),
            position: LatLng(23.800150989663358, 90.37379465997219),
            infoWindow: InfoWindow(
              title: 'Home',
              onTap: () {
                // TODO: on tapped info window
              },
            ),
          ),
          Marker(
            markerId: MarkerId('office'),
            position: LatLng(23.80321889796988, 90.37127338349819),
            infoWindow: InfoWindow(
              title: 'Office',
              onTap: () {
                // TODO: on tapped info window
              },
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
            // icon: await BitmapDescriptor.asset(
            //     ImageConfiguration(), 'path of your icon')
          ),
        },
        circles: <Circle> {
          Circle(
            circleId: CircleId('red-zone'),
            center: LatLng(23.807251763483695, 90.368513725698),
            radius: 500,
            fillColor: Colors.red.withAlpha(50),
            strokeColor: Colors.red,
            strokeWidth: 3,
            onTap: () {
              print('tapped on red-zone circle');
            },
            consumeTapEvents: true,
          ),
          Circle(
            circleId: CircleId('green-zone'),
            center: LatLng(23.79118244110137, 90.37529770284891),
            radius: 500,
            fillColor: Colors.green.withAlpha(50),
            strokeColor: Colors.green,
            strokeWidth: 3,
            onTap: () {
              print('tapped on green-zone circle');
            },
            consumeTapEvents: true,
          )
        },
        polylines: <Polyline> {
          Polyline(
            polylineId: PolylineId('road-to-office'),
            points: [
              LatLng(23.800150989663358, 90.37379465997219),
              LatLng(23.80321889796988, 90.37127338349819),
              LatLng(23.800394866637248, 90.3688483312726)
            ],
            width: 10,
            color: Colors.blue,
            endCap: .roundCap,
            startCap: .roundCap,
            visible: true
          )
        },
        polygons: <Polygon> {
          Polygon(
            polygonId: PolygonId('danger-area'),
            points: [
              LatLng(23.778006586811767, 90.35922825336456),
              LatLng(23.774350208584387, 90.34503668546677),
              LatLng(23.76179525763401, 90.35215627402067),
              LatLng(23.75785027918789, 90.3583263605833),
              LatLng(23.760235814826416, 90.366489328444),
              LatLng(23.76607150865706, 90.36912761628628),
              LatLng(23.77268260579799, 90.36725409328938),
              LatLng(23.777047783131415, 90.36143001168966),
              LatLng(23.779566123425163, 90.35585939884186)
            ],
            fillColor: Colors.red.withAlpha(50),
            strokeColor: Colors.orange,
            strokeWidth: 3,
            consumeTapEvents: true,
            onTap: () {
              print('Tapped on danger area');
            }
          )
        },
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
