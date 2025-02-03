import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/model/detail_restaurant.dart';
import 'package:restaurant_app/model/list_restaurant.dart';
import 'package:http/http.dart' as http;

class ConfigApi with ChangeNotifier {
  final Link _configLink = new Link();
  List<Restaurant> _lists = [];
  DetailRestaurant? _restaurant;
  bool _isLoading = false;
  bool _isDetailLoading = false;

  List<Restaurant> get lists => _lists;
  DetailRestaurant? get restaurant => _restaurant;
  bool get isLoading => _isLoading;
  bool get isDetailLoading => _isDetailLoading;

  Future<void> getListRestaurant() async{
    _isLoading = true;
    notifyListeners();

    final url = _configLink.getLinkListRestaurant();
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
        final listRestaurant = ListRestaurant.fromJson(json.decode(response.body));
        _lists = listRestaurant.restaurants;
      }else{
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      print("Error : ${e}");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDetailRestaurant(String res_id) async{
    _isDetailLoading = true;
    notifyListeners();

    final url = _configLink.getLinkDetailRestaurant(res_id);
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
        final detail_restaurant = DetailRestaurant.fromJson(json.decode(response.body));
        _restaurant = detail_restaurant;
      }else{
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      print("Error : ${e}");
    } finally {
      _isDetailLoading = false;
      notifyListeners();
    }
  }
}