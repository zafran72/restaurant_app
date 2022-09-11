import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late RestauranList _restaurantList;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestauranList get result => _restaurantList;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.topRestaurants();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantList = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
