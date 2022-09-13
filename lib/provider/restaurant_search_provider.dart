import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';
import 'package:flutter/material.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  final String query;

  RestaurantSearchProvider(this.query, {required this.apiService}) {
    _fetchAllRestaurantSearch();
  }

  late RestaurantSearch _restaurantSearch;
  late ResultState _state;
  String _message = '';

  RestaurantSearch get result => _restaurantSearch;

  ResultState get state => _state;

  String get message => _message;

  Future<dynamic> _fetchAllRestaurantSearch() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restaurantSearch(query);
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantSearch = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'not found';
    }
  }
}
