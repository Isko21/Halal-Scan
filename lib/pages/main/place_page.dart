import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/widgets/appbar.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({super.key});

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  final Completer<GoogleMapController> controller = Completer();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(52.156256, 21.031030),
    zoom: 14.4746,
  );

  bool isTrafficEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'PLACES',
        name: CustomPageName.map,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: false,
        mapToolbarEnabled: false,
        initialCameraPosition: kGooglePlex,
        indoorViewEnabled: true,
        trafficEnabled: isTrafficEnabled,
        buildingsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (c) {
          controller.complete(c);
        },
      ),
    );
  }
}
