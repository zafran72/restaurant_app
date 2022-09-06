import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';

class RestaurantProvider extends ChangeNotifier {
  late Future<RestauranList> _restaurant = ApiService().topRestaurants('/list');

  void changeRestaurant(String route) {
    _restaurant = ApiService().topRestaurants(route);
  }
}
