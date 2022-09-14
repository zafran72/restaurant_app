import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  final String id;

  RestaurantDetailProvider(this.id, {required this.apiService}) {
    _fetchAllRestaurantDetail();
  }

  late RestauranDetail _restaurantDetail;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestauranDetail get result => _restaurantDetail;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurantDetail() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restaurantDetail(id);
      if (restaurant.restaurant.menus.foods.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetail = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
