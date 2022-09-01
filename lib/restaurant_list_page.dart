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
        title: const Text('Restaurant List'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseArticles(snapshot.data);
          return ListView.builder(
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
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    leading: Image.network(
      restaurant.pictureId,
      width: 100,
    ),
    title: Text(restaurant.name),
    subtitle: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.city),
          Text(restaurant.rating.toString()),
        ],
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context, RestaurantDetailPage.routeName,
          arguments: restaurant);
    },
  );
}
