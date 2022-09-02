import 'package:flutter/material.dart';
import 'package:restaurant_app/restauran.dart';
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
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseArticles(snapshot.data);
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, restaurants[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Restaurant restaurant) {
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
                child: Image.network(restaurant.pictureId),
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
                      Text(restaurant.rating.toString(),
                          style: Theme.of(context).textTheme.subtitle2),
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
