import 'package:flutter/material.dart';
import 'package:restaurant_app/model/add_riview.dart';
import 'package:restaurant_app/model/detail_restaurant.dart';
import 'package:restaurant_app/services/api_services.dart';
import 'package:restaurant_app/utils/api_result.dart';

class ConfigApi with ChangeNotifier {
  final ApiServices apiServices;
  ApiResult<List<Restaurant>> _listRestaurants = const Initial();
  ApiResult<List<Restaurant>> get listRestaurants => _listRestaurants;

  ApiResult<Restaurant> _restaurant = const Loading();
  ApiResult<Restaurant> get restaurant => _restaurant;

  ApiResult<AddRiview> _addReview = const Initial();
  ApiResult<AddRiview> get addRiview => _addReview;

  ApiResult<List<Restaurant>> _searchListRestaurant = const Initial();
  ApiResult<List<Restaurant>> get searchListRestaurant => _searchListRestaurant;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  ConfigApi(this.apiServices){
    getListRestaurant();
  }

  void cleartext() {
    nameController.clear();
    reviewController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }


  Future<void> getListRestaurant() async{
    try {
      _listRestaurants = const Loading();
      notifyListeners();
      final data = await apiServices.getAllRestaurant();
      if(data is Success){
        _listRestaurants = data;
      }else{
        _listRestaurants = Error('Gagal Load Data');
      }
      notifyListeners();
    } catch (e) {
      _listRestaurants = Error(e.toString());
      notifyListeners();
    }
  }

  Future<void> getRestaurant(String id) async{
    try {
      _restaurant = const Loading();
      notifyListeners();
      final data = await apiServices.getRestaurant(id);
      _restaurant = data;
      notifyListeners();
    } catch (e) {
      _restaurant = Error(e.toString());
      notifyListeners();
    }
  }

  Future<void> addReviewRestaurant(String id, String name, String review) async{
    try {
      _addReview = const Loading();
      notifyListeners();
      final data = await apiServices.addReviewRestaurant(id, name, review);
      _addReview = data;
      notifyListeners();
      await getRestaurant(id);
    } catch (e) {
      _addReview = Error(e.toString());
      notifyListeners();
    }
  }

  Future<void> getSearchRestaurant(String name) async{
    try {
      _searchListRestaurant = const Loading();
      notifyListeners();
      final data = await apiServices.findRestaurantByName(name);
      _searchListRestaurant = data;
      notifyListeners();
    } catch (e) {
      _searchListRestaurant = Error(e.toString());
      notifyListeners();
    }
  }
}