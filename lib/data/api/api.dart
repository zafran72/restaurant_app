import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_list.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestauranList> topRestaurants(String get) async {
    final response = await http.get(Uri.parse("$_baseUrl/$get"));
    return RestauranList.fromJson(json.decode(response.body));
  }
}
