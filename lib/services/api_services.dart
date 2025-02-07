import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/helper/link.dart';
import 'package:restaurant_app/model/add_riview.dart';
import 'package:restaurant_app/model/detail_restaurant.dart';
import 'package:restaurant_app/model/list_restaurant.dart';
import 'package:restaurant_app/utils/api_result.dart';

class ApiServices {
  final Link linkApi = Link();

  Future<ApiResult<List<Restaurant>>> getAllRestaurant() async{
    try {
      final response = await http.get(linkApi.getLinkListRestaurant());
      if(response.statusCode == 200){
        final data = json.decode(response.body);
        List<Restaurant> restaurants = (data['restaurants'] as List).map((item) => Restaurant.fromJson(item)).toList();
        return Success(restaurants);
      }else{
        return Error("Gagal Memuat Daftar Restaurant. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      return Error("Terjadi kesalahan: ${e.toString()}");
    }
  }

  Future<ApiResult<Restaurant>> getRestaurant(String id) async{
    try {
      final response = await http.get(linkApi.getLinkDetailRestaurant(id));
      if(response.statusCode == 200){
        final data = json.decode(response.body);
        Restaurant restaurant = Restaurant.fromJson(data['restaurant']);
        return Success(restaurant);
      }else{
        return Error("Gagal Memuat Detail Restaurant. Status Code: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      return Error("Terjadi kesalahan: ${e.toString()}");
    }
  }

  Future<ApiResult<AddRiview>> addReviewRestaurant(String id, String name, String review) async{
    try {
      final response = await http.post(
        linkApi.getLinkAddReviewRestaurant(),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "id" : id,
          "name" : name,
          "review" : review,
        })
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        final data = json.decode(response.body);
        AddRiview newReview = AddRiview .fromJson(data);
        return Success(newReview);
      }else{
        return Error("Gagal Menambahkan Review Restaurant. Status Code: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      return Error("Terjadi kesalahan: ${e.toString()}");
    }
  }

  Future<ApiResult<List<Restaurant>>> findRestaurantByName(String name) async{
    try {
      final response = await http.get(linkApi.getLinkSearchRestaurant(name));
      if(response.statusCode == 200){
        final data = json.decode(response.body);
        List<Restaurant> restaurants = (data['restaurants'] as List).map((item) => Restaurant.fromJson(item)).toList();
        if(name != ""){
          return Success(restaurants);
        }else{
          return const Success([]);
        }
      }else{
        return Error("Gagal Memuat Daftar Pencarian Restaurant. Status Code: ${response.statusCode}");
      }
    } catch (e, stackTrace) {
      return Error("Terjadi kesalahan: ${e.toString()}");
    }
  }
}