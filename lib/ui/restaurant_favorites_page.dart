import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/ui/restaurant_card.dart';
import '../utils/result_state.dart';

class FavoritesPage extends StatelessWidget {
  static const String favoritesTitle = 'Favorites';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Favorite Restaurants',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
                return CardRestaurant(restaurant: provider.favorites[index]);
              },
            );
          } else {
            return const Center(
              child: Text('no favorites'),
            );
          }
        },
      ),
    );
  }
}
