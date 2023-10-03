// To parse this JSON data, do
//
//     final ridesModel = ridesModelFromJson(jsonString);

import 'dart:convert';

List<RidesModel> ridesModelFromJson(String str) => List<RidesModel>.from(json.decode(str).map((x) => RidesModel.fromJson(x)));

String ridesModelToJson(List<RidesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RidesModel {
    final String? uniqueId;
    final double? latitude;
    final double? longitude;
    final num? speed;
    final num? distance;
    final bool? powerOn;
    final bool? valid;
    final DateTime? serverTime;
    final DateTime? deviceTime;
    final num? extBatteryVoltage;
    final String? fromLocation;
    final String? toLocation;
    final String? distanceTravel;
    final String? fromTime;
    final String? toTime;

    RidesModel({
        this.uniqueId,
        this.latitude,
        this.longitude,
        this.speed,
        this.distance,
        this.powerOn,
        this.valid,
        this.serverTime,
        this.deviceTime,
        this.extBatteryVoltage,
        this.fromLocation,
        this.toLocation,
        this.distanceTravel,
        this.fromTime,
        this.toTime,
    });

    RidesModel copyWith({
        String? uniqueId,
        double? latitude,
        double? longitude,
        num? speed,
        num? distance,
        bool? powerOn,
        bool? valid,
        DateTime? serverTime,
        DateTime? deviceTime,
        num? extBatteryVoltage,
        String? fromLocation,
        String? toLocation,
        String? distanceTravel,
        String? fromTime,
        String? toTime,
    }) => 
        RidesModel(
            uniqueId: uniqueId ?? this.uniqueId,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            speed: speed ?? this.speed,
            distance: distance ?? this.distance,
            powerOn: powerOn ?? this.powerOn,
            valid: valid ?? this.valid,
            serverTime: serverTime ?? this.serverTime,
            deviceTime: deviceTime ?? this.deviceTime,
            extBatteryVoltage: extBatteryVoltage ?? this.extBatteryVoltage,
            fromLocation: fromLocation ?? this.fromLocation,
            toLocation: toLocation ?? this.toLocation,
            distanceTravel: distanceTravel ?? this.distanceTravel,
            fromTime: fromTime ?? this.fromTime,
            toTime: toTime ?? this.toTime,
        );

    factory RidesModel.fromJson(Map<String, dynamic> json) => RidesModel(
        uniqueId: json["UniqueId"],
        latitude: json["Latitude"]?.toDouble(),
        longitude: json["Longitude"]?.toDouble(),
        speed: json["Speed"],
        distance: json["Distance"],
        powerOn: json["PowerOn"],
        valid: json["Valid"],
        serverTime: json["ServerTime"] == null ? null : DateTime.parse(json["ServerTime"]),
        deviceTime: json["DeviceTime"] == null ? null : DateTime.parse(json["DeviceTime"]),
        extBatteryVoltage: json["ExtBatteryVoltage"],
        fromLocation: json["fromLocation"],
        toLocation: json["toLocation"],
        distanceTravel: json["distanceTravel"],
        fromTime: json["fromTime"],
        toTime: json["toTime"],
    );

    Map<String, dynamic> toJson() => {
        "UniqueId": uniqueId,
        "Latitude": latitude,
        "Longitude": longitude,
        "Speed": speed,
        "Distance": distance,
        "PowerOn": powerOn,
        "Valid": valid,
        "ServerTime": serverTime?.toIso8601String(),
        "DeviceTime": deviceTime?.toIso8601String(),
        "ExtBatteryVoltage": extBatteryVoltage,
        "fromLocation": fromLocation,
        "toLocation": toLocation,
        "distanceTravel": distanceTravel,
        "fromTime": fromTime,
        "toTime": toTime,
    };
}
