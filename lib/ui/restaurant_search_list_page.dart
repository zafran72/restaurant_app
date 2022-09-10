import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_search.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';

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
                    return CardSearchRestaurant(restaurant: restaurant);
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

class CardSearchRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardSearchRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}"),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(restaurant.name,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      children: [
                        const Icon(Icons.location_pin, size: 16),
                        Text(restaurant.city,
                            style: Theme.of(context).textTheme.subtitle2),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16),
                      Text(
                        restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
