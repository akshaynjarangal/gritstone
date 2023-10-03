import 'dart:async';
import 'dart:math';

import 'package:elthor/src/providers/ride_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Consumer<RideProvider>(builder: (context, state, _) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            strokeCap: StrokeCap.round,
          ),
        );
      }
      if (state.isSuccess) {
        if (state.rides.isEmpty) {
          return const Center(
            child: Text("Data Not Available.."),
          );
        }
        return GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(state.rides[0].latitude!, state.rides[0].longitude!)));
          },
          zoomControlsEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(state.rides[0].latitude!, state.rides[0].longitude!),
            zoom: 20.0,
          ),
          markers: {
            Marker(
              infoWindow: const InfoWindow(
                title: 'Current Location'
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
              position: LatLng(state.rides[0].latitude!, state.rides[0].longitude!),
              markerId: const MarkerId('grib'))
          }..addAll(state.rides.map((location) {
            return Marker(
              position: LatLng(location.latitude!, location.longitude!),
              markerId: MarkerId(Random().nextInt(5000).toString()));
          })),
          polylines: {
            Polyline(
              polylineId: const PolylineId('myid'),
              color: CupertinoColors.systemBlue,
              width: 5,
              points: state.rides.map((e) {
                return LatLng(e.latitude!, e.longitude!);
              }).toList()
              )
          },
        );
      }
      return Container();
    });
  }
}
