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
        title: Text(
          restaurant.name.toUpperCase(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(restaurant.pictureId),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                            ),
                            Text(
                              restaurant.rating.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin),
                            Flexible(
                              child: Text(
                                restaurant.city,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.75,
                    height: 30,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 7.5,
                  ),
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 8,
                  ),
                  const Divider(
                    thickness: 0.75,
                    height: 20,
                  ),
                  Text(
                    "Foods",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 10),
                    itemCount: restaurant.menus.foods.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.asset('assets/images/food.png'),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                restaurant.menus.foods[index].name,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  Text("Drinks", style: Theme.of(context).textTheme.headline6),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 10),
                    itemCount: restaurant.menus.drinks.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                        color: const Color(0xFFB9E4C9),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.asset('assets/images/drinks.png'),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                restaurant.menus.drinks[index].name,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
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
