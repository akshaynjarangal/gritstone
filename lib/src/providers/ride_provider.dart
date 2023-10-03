import 'package:elthor/src/data/models/rides_model.dart';
import 'package:elthor/src/data/repositories/ride_repo.dart';
import 'package:flutter/material.dart';

class RideProvider extends ChangeNotifier{
  final RideRepo _rideRepo;
  RideProvider({required RideRepo rideRepo}) : _rideRepo = rideRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  set _setSuccess (bool value){
    _isSuccess = value;
    notifyListeners();
  }

  set _setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }


  List<RidesModel> get rides => _rides;

  List<RidesModel> _rides = [];

  set _setList(List<RidesModel> list) {
    _rides = list;
    notifyListeners();
  }

  Future<void> get getRideData async {
    _setLoading = true;
    final list = await _rideRepo.getRides;
    if(list.isNotEmpty){
      _setSuccess = true;
      _setLoading = false;
      _setList = list;
    }else{
       _setSuccess = false;
      _setLoading = false;
    }
  }
}