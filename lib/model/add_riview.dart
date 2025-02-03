import 'package:restaurant_app/model/detail_restaurant.dart';

class AddRiview {
  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  AddRiview({
      required this.error,
      required this.message,
      required this.customerReviews,
  });

  factory AddRiview.fromJson(Map<String, dynamic> json) => AddRiview(
      error: json["error"],
      message: json["message"],
      customerReviews: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "error": error,
      "message": message,
      "customerReviews": List<dynamic>.from(customerReviews.map((x) => x.toJson())),
  };
}