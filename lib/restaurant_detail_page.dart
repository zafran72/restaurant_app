import 'package:flutter/material.dart';
import 'package:restaurant_app/restauran.dart';
import 'package:restaurant_app/styles.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text(
          restaurant.name.toUpperCase(),
          style: Theme.of(context).textTheme.headline4,
        ),
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
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          restaurant.name,
                          style: const TextStyle(
                            color: primaryColor,
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
                              color: Colors.amber,
                            ),
                            Text(
                              restaurant.rating.toString(),
                              style: const TextStyle(
                                color: primaryColor,
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
                            const Icon(
                              Icons.location_pin,
                              color: Colors.black,
                            ),
                            Text(
                              restaurant.city,
                              style: const TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.75,
                    height: 30,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(
                      color: primaryColor,
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
                    color: Colors.grey,
                    thickness: 0.75,
                    height: 20,
                  ),
                  const Text(
                    "Foods",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
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
                        color: const Color(0xFFB9E4C9),
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
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  const Text(
                    "Drinks",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                style: const TextStyle(fontSize: 12),
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
