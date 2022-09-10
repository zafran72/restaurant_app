import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/data/model/restaurant_search.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String _getList = 'list';
  static const String _getDetail = 'detail';
  static const String _getSearch = 'search?q=';
  List<RestauranList> results = [];
  var data = [];

  Future<RestauranList> topRestaurants() async {
    final response = await http.get(Uri.parse("$_baseUrl/$_getList"));
    if (response.statusCode == 200) {
      return RestauranList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load restaurant list");
    }
  }

  Future<RestauranDetail> restaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$_getDetail/$id"));
    if (response.statusCode == 200) {
      return RestauranDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<RestaurantSearch> restaurantSearch(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/$_getSearch$query"));
    if (response.statusCode == 200) {
      return RestaurantSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load restaurant search");
    }
  }
}
