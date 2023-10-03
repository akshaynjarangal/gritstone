import 'package:elthor/src/data/models/rides_model.dart';

abstract class RideService {

  //GET Ride Details
  Future<List<RidesModel>> get getRides;

}


