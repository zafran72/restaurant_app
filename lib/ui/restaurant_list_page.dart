import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/restaurant_card.dart';
import 'package:restaurant_app/ui/restaurant_search.dart';

class RestoListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'FAVESTO',
                style: Theme.of(context).textTheme.headline5,
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Choose Your Favorite Restaurant',
                    style: Theme.of(context).textTheme.subtitle2,
                    maxLines: 2,
                  ),
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: (() {
                    Navigator.pushNamed(
                        context, RestaurantSearchPage.routeName);
                  }),
                  icon: const Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
        body: Consumer<RestaurantProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (state.state == ResultState.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.result.restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurant = state.result.restaurants[index];
                    return CardRestaurant(
                      restaurant: restaurant,
                    );
                  },
                );
                // success widget
              } else if (state.state == ResultState.error) {
                // error widget
                return const Center(
                  child: Text("No Internet Connection"),
                );
              } else {
                // loading widget
                return const Center(child: CircularProgressIndicator());
              }
            }
          },
        ),
      ),
    );
  }
}
