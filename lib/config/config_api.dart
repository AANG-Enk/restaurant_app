import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/model/add_riview.dart';
import 'package:restaurant_app/model/detail_restaurant.dart';
import 'package:restaurant_app/model/list_restaurant.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/model/search_restaurant.dart';

class ConfigApi with ChangeNotifier {
  final Link _configLink = new Link();
  List<Restaurant> _lists = [];
  List<AddRiview> _reviews = [];
  DetailRestaurant? _restaurant;
  List<Restaurant> _listRestaurant = [];
  String _message = '';
  bool _isLoading = false;
  bool _isDetailLoading = false;
  bool _isAddReviewLoading = false;
  bool _isSearchLoading = false;

  List<Restaurant> get lists => _lists;
  List<AddRiview> get riviews => _reviews;
  DetailRestaurant? get restaurant => _restaurant;
  List<Restaurant> get listRestaurant => _listRestaurant;
  bool get isLoading => _isLoading;
  bool get isDetailLoading => _isDetailLoading;
  bool get isAddreviewLoading => _isAddReviewLoading;
  String get message => _message;
  bool get isSearchLoading => _isSearchLoading;

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
    } catch (e, stackTrace) {
      print("Error : ${e.toString()}");
      print("Stack Trace : ${stackTrace}");
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

  void updateReview(CustomerReview custom){
    if(restaurant != null){
      restaurant!.restaurant.customerReviews!.insert(0, custom);
      notifyListeners();
    }
  }

  Future<void> addReviewRestaurant(BuildContext context, String id, String name, String review) async{
    _isAddReviewLoading = true;
    notifyListeners();

    final url = _configLink.getLinkAddReviewRestaurant();
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "id" : id,
          "name" : name,
          "review" : review,
        }),
      );
      if(response.statusCode == 201 || response.statusCode == 200){
        final data = json.decode(response.body);
        AddRiview newReviewRestaurant = AddRiview.fromJson(data);
        Provider.of<ConfigApi>(context, listen: false).updateReview(newReviewRestaurant.customerReviews.last);
      }else{
        throw Exception('Failed to load review');
      }
    } catch (e) {
      print("Error : ${e}");
    } finally {
      _isDetailLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchByNameRestaurant(BuildContext context, String search) async{
    _isSearchLoading = true;
    notifyListeners();
    _listRestaurant.clear();
    final url = _configLink.getLinkSearchRestaurant(search);
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
        if(search != ''){
          final search_restaurant = SearchRestaurant.fromJson(json.decode(response.body));
          _listRestaurant = search_restaurant.restaurants;
        }else{
          _listRestaurant.clear();
        }
      }else{
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      print("Error : ${e}");
    } finally {
      _isSearchLoading = false;
      notifyListeners();
    }
  }
}