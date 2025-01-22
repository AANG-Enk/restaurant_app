import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/model/list_restaurant.dart';
import 'package:http/http.dart' as http;

class ConfigApi with ChangeNotifier {
  final Link _configLink = new Link();
  List<Restaurant> _lists = [];
  bool _isLoading = false;

  List<Restaurant> get lists => _lists;
  bool get isLoading => _isLoading;

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
}