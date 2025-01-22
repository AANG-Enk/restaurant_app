import 'package:flutter/material.dart';

class Link {
  final String BASE_URL = "https://restaurant-api.dicoding.dev";

  Uri getLinkListRestaurant()
  {
    return Uri.parse('${BASE_URL}/list');
  }

  Uri getLinkDetailRestaurant(int id)
  {
    return Uri.parse('${BASE_URL}/detail/${id}');
  }

  Uri getLinkSearchRestaurant(String text)
  {
    return Uri.parse('${BASE_URL}/search?q=${text}');
  }

  Uri getLinkAddReviewRestaurant()
  {
    return Uri.parse('${BASE_URL}/review');
  }

  getLinkImage(String type, String id){
    if(type == 'small'){
      return NetworkImage('${BASE_URL}/images/small/${id}');
    }else if(type == 'medium'){
      return NetworkImage('${BASE_URL}/images/medium/${id}');
    }else{
      return NetworkImage('${BASE_URL}/images/large/${id}');
    }
  }
}