import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/restaurant_detail_page.dart';

class RestoListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'FAVESTO',
              style: Theme.of(context).textTheme.headline5,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Choose Your Favorite Restaurant',
                  style: Theme.of(context).textTheme.subtitle2,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: ApiService().topRestaurants(),
        builder: (context, AsyncSnapshot<RestauranList> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // loading widget
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: snapshot.data?.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = snapshot.data?.restaurants[index];
                  return CardRestaurant(
                    restaurant: restaurant!,
                  );
                },
              );
              // success widget
            } else if (snapshot.hasError) {
              // error widget
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              // loading widget
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
      child: Container(
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
      ),
    );
    //
  }
}
