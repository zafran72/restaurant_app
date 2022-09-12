import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

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
                      "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}"),
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
                          Expanded(
                            flex: 10,
                            child: Text(restaurant.name,
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: Icon(Icons.favorite_outline)
                          // ),
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
