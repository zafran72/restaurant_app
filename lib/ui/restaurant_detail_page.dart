import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';

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
              child: Image.network(
                  "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}"),
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
                  FutureBuilder(
                    future: ApiService().restaurantDetail(restaurant.id),
                    builder:
                        (context, AsyncSnapshot<RestauranDetail> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        // loading widget
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 150,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 10),
                            padding: const EdgeInsets.all(8.0),
                            itemCount:
                                snapshot.data?.restaurant.menus.foods.length,
                            itemBuilder: (context, index) {
                              var food =
                                  snapshot.data?.restaurant.menus.foods[index];
                              return CardMenus(
                                menus: food!,
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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }
                    },
                  ),
                  const Divider(),
                  Text("Drinks", style: Theme.of(context).textTheme.headline6),
                  FutureBuilder(
                    future: ApiService().restaurantDetail(restaurant.id),
                    builder:
                        (context, AsyncSnapshot<RestauranDetail> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        // loading widget
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 150,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 10),
                            padding: const EdgeInsets.all(8.0),
                            itemCount:
                                snapshot.data?.restaurant.menus.drinks.length,
                            itemBuilder: (context, index) {
                              var drink =
                                  snapshot.data?.restaurant.menus.drinks[index];
                              return CardMenus2(menus: drink!);
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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }
                    },
                  ),
                  // GridView.builder(
                  //   primary: false,
                  //   shrinkWrap: true,
                  //   gridDelegate:
                  //       const SliverGridDelegateWithMaxCrossAxisExtent(
                  //           maxCrossAxisExtent: 150,
                  //           crossAxisSpacing: 30,
                  //           mainAxisSpacing: 10),
                  //   itemCount: restaurant.menus.drinks.length,
                  //   itemBuilder: (BuildContext ctx, index) {
                  //     return Card(
                  //       color: const Color(0xFFB9E4C9),
                  //       child: Column(
                  //         children: [
                  //           Expanded(
                  //             flex: 4,
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(top: 8.0),
                  //               child: Image.asset('assets/images/drinks.png'),
                  //             ),
                  //           ),
                  //           Expanded(
                  //             flex: 1,
                  //             child: Text(
                  //               restaurant.menus.drinks[index].name,
                  //               style: Theme.of(context).textTheme.subtitle1,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardMenus extends StatelessWidget {
  final Category menus;

  const CardMenus({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
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
              menus.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}

class CardMenus2 extends StatelessWidget {
  final Category menus;

  const CardMenus2({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset('assets/images/drink.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              menus.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
