class RestauranDetail {
  RestauranDetail({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  final bool error;
  final String message;
  final RestaurantDetailMore restaurant;

  factory RestauranDetail.fromJson(Map<String, dynamic> json) =>
      RestauranDetail(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetailMore.fromJson(json["restaurant"]),
      );
}

class RestaurantDetailMore {
  RestaurantDetailMore({
    required this.address,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  final String address;
  final List<Category> categories;
  final Menus menus;
  final List<CustomerReview> customerReviews;

  factory RestaurantDetailMore.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailMore(
        address: json["address"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );
}

class Category {
  Category({
    required this.name,
  });

  final String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );
}

class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  final String name;
  final String review;
  final String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  final List<Category> foods;
  final List<Category> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods:
            List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
        drinks: List<Category>.from(
            json["drinks"].map((x) => Category.fromJson(x))),
      );
}
