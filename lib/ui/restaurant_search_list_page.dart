import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/ui/restaurant_card.dart';

class RestaurantSearchListPage extends StatelessWidget {
  static const routeName = '/restaurant_search_list';

  final String query;

  const RestaurantSearchListPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (_) => RestaurantSearchProvider(query, apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Searching restaurant')),
        body: Consumer<RestaurantSearchProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (state.state == ResultState.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.result.founded,
                  itemBuilder: (BuildContext context, int index) {
                    var restaurant = state.result.restaurants[index];
                    var restaurant2 = Restaurant(
                        id: restaurant.id,
                        name: restaurant.name,
                        description: restaurant.description,
                        pictureId: restaurant.pictureId,
                        city: restaurant.city,
                        rating: restaurant.rating);
                    return CardRestaurant(restaurant: restaurant2);
                  },
                );
              } else if (state.state == ResultState.error) {
                return Center(
                  child: Text(state.message.toString()),
                );
              } else {
                return const Center(child: Text("not found"));
              }
            }
          },
        ),
      ),
    );
  }
}
