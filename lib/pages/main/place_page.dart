import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!isServiceEnabled) {
            return Future.error('Location service is disabled!');
          }
          LocationPermission permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
              return Future.error('Location permissions are denied!');
            }
          }
          if (permission == LocationPermission.deniedForever) {
            return Future.error('Location is desabled forever!');
          }
        },
        backgroundColor: Colors.white,
        child: Icon(
          CupertinoIcons.location_fill,
          color: CustomColor.darkBackColor,
        ),
      ),
    );
  }
}
