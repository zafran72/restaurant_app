import 'package:flutter/material.dart';
import 'package:restaurant_app/restauran.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(restaurant.description),
                  const Divider(color: Colors.grey),
                  const Text("Foods"),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 10),
                    itemCount: restaurant.menus.foods.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                        child: Center(
                            child: Text(restaurant.menus.foods[index].name)),
                      );
                    },
                  ),
                  const Text("Drinks"),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 10),
                    itemCount: restaurant.menus.drinks.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                        child: Center(
                            child: Text(restaurant.menus.drinks[index].name)),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
