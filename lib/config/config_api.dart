import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/model/add_riview.dart';
import 'package:restaurant_app/model/detail_restaurant.dart';
import 'package:restaurant_app/model/list_restaurant.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/model/search_restaurant.dart';
import 'package:restaurant_app/services/api_services.dart';
import 'package:restaurant_app/utils/api_result.dart';

class ConfigApi with ChangeNotifier {
  final ApiServices apiServices;
  ApiResult<List<Restaurant>> _listRestaurants = const Initial();
  ApiResult<List<Restaurant>> get listRestaurants => _listRestaurants;

  ApiResult<Restaurant> _restaurant = const Initial();
  ApiResult<Restaurant> get restaurant => _restaurant;

  ApiResult<AddRiview> _addReview = const Initial();
  ApiResult<AddRiview> get addRiview => _addReview;

  ApiResult<List<Restaurant>> _searchListRestaurant = const Initial();
  ApiResult<List<Restaurant>> get searchListRestaurant => _searchListRestaurant;

  ConfigApi(this.apiServices){
    getListRestaurant();
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
    } catch (e, stackTrace) {
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
    } catch (e, stackTrace) {
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