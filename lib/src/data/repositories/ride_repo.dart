import 'package:elthor/src/data/models/rides_model.dart';
import 'package:elthor/src/data/services/ride_service.dart';

class RideRepo {
  final RideService _rideService;
  RideRepo({required RideService rideService}) : _rideService = rideService;

  Future<List<RidesModel>> get getRides {
    return  _rideService.getRides;
  }
}