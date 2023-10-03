import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../../constants/app_urls.dart';
import '../models/rides_model.dart';
import 'ride_service.dart';
import 'package:http/http.dart' as http;

class RideImpl implements RideService {
  @override
  Future<List<RidesModel>> get getRides async {
    try {
      final date = DateTime.now();

      final uri = Uri.https(AppUrl.host, AppUrl.deviceDataEndPoint, {
        "uniqueid": "230304558",
        "limit": "5000",
        "fromTime": DateTime(date.year, date.month, date.day, date.hour - 12)
            .toString(),
        "toTime": DateTime.now().toString()
      });
      final res = await http.get(uri);
      if (res.statusCode == 200) {
        log("RES --> ${res.body}");
        final decoded = await compute(ridesModelFromJson, res.body);
        for (var i = 0; i < decoded.length - 1; i++) {
          List<Placemark> from = await placemarkFromCoordinates(
              decoded[i].latitude!, decoded[i].longitude!);
          List<Placemark> toloc = await placemarkFromCoordinates(
              decoded[i + 1].latitude!, decoded[i + 1].longitude!);
          final distance = Geolocator.distanceBetween(
              decoded[i].latitude!,
              decoded[i].longitude!,
              decoded[i + 1].latitude!,
              decoded[i + 1].longitude!);
          log("PLACE ========> ${from[0].locality}");
          final fromTime = DateFormat('hh:mm a').format(decoded[i+1].deviceTime!);
          final toTime = DateFormat('hh:mm a').format(decoded[i].deviceTime!);
          decoded[i] = decoded[i].copyWith(
            fromLocation: '${from[0].street},${from[0].locality}',
            toLocation: '${toloc[0].street},${toloc[0].locality}',
            distanceTravel: distance.toStringAsFixed(2),
            fromTime: fromTime,
            toTime: toTime
          );
        }

        return decoded;
      }
      return [];
    } catch (e) {
      log("ERROR FOUND --> $e");
      return [];
    }
  }
}
