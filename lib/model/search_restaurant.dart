import 'package:restaurant_app/model/detail_restaurant.dart';

class SearchRestaurant {
  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  SearchRestaurant({
      required this.error,
      required this.founded,
      required this.restaurants,
  });

  factory SearchRestaurant.fromJson(Map<String, dynamic> json) => SearchRestaurant(
      error: json["error"],
      founded: json["founded"],
      restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "error": error,
      "founded": founded,
      "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

// class Restaurant {
//     final String id;
//     final String name;
//     final String description;
//     final String pictureId;
//     final String city;
//     final double rating;

//     Restaurant({
//         required this.id,
//         required this.name,
//         required this.description,
//         required this.pictureId,
//         required this.city,
//         required this.rating,
//     });

//     factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         pictureId: json["pictureId"],
//         city: json["city"],
//         rating: json["rating"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "pictureId": pictureId,
//         "city": city,
//         "rating": rating,
//     };
// }