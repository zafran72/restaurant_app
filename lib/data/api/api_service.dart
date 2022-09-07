import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String _getList = '/list';
  static const String _getDetail = '/detail/';

  Future<RestauranList> topRestaurants() async {
    final response = await http.get(Uri.parse("$_baseUrl$_getList"));
    return RestauranList.fromJson(json.decode(response.body));
  }

  Future<RestauranDetail> restaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl$_getDetail$id"));
    return RestauranDetail.fromJson(json.decode(response.body));
  }
}
