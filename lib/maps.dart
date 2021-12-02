import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Set<Marker> _markers = {};

  void _onMapCraeted(GoogleMapController controller) {
    setState(() {
      _markers.add(
        const Marker(
          markerId: MarkerId('Место-1'),
          position: LatLng(43.259155, 76.906305),
        ),
      );
      _markers.add(
        const Marker(
          markerId: MarkerId('Место-2'),
          position: LatLng(43.254686, 76.900064),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('7Food на карте'),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCraeted,
        markers: _markers,
        initialCameraPosition: const CameraPosition(
          target: LatLng(43.25376, 76.8835584),
          zoom: 14,
        ),
      ),
    );
  }
}
