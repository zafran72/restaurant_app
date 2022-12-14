import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (_) =>
          RestaurantDetailProvider(restaurant.id, apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            restaurant.name.toUpperCase(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<RestaurantDetailProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    // loading widget
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (state.state == ResultState.hasData) {
                      return Consumer<DatabaseProvider>(
                          builder: (context, provider, child) {
                        return FutureBuilder<bool>(
                            future: provider.isFavorited(restaurant.id),
                            builder: (context, snapshot) {
                              var isFavorited = snapshot.data ?? false;
                              return Hero(
                                tag: restaurant.pictureId,
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Image.network(
                                        "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}"),
                                    // const FavoriteButton(),
                                    isFavorited
                                        ? IconButton(
                                            icon: const Icon(MdiIcons.heart),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            onPressed: () => provider
                                                .removeFavorite(restaurant.id),
                                          )
                                        : IconButton(
                                            icon: const Icon(
                                                MdiIcons.heartOutline),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            onPressed: () => provider
                                                .addFavorite(restaurant),
                                          ),
                                  ],
                                ),
                              );
                            });
                      });
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
                    Consumer<RestaurantDetailProvider>(
                      builder: (context, state, _) {
                        if (state.state == ResultState.loading) {
                          // loading widget
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (state.state == ResultState.hasData) {
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
                                  state.result.restaurant.menus.foods.length,
                              itemBuilder: (context, index) {
                                var food =
                                    state.result.restaurant.menus.foods[index];
                                return CardMenus(menus: food);
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
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }
                      },
                    ),
                    const Divider(),
                    Text("Drinks",
                        style: Theme.of(context).textTheme.headline6),
                    Consumer<RestaurantDetailProvider>(
                      builder: (context, state, _) {
                        if (state.state == ResultState.loading) {
                          // loading widget
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (state.state == ResultState.hasData) {
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
                                  state.result.restaurant.menus.drinks.length,
                              itemBuilder: (context, index) {
                                var drink =
                                    state.result.restaurant.menus.drinks[index];
                                return CardMenus2(menus: drink);
                              },
                            );
                            // success widget
                          } else if (state.state == ResultState.error) {
                            // error widget
                            return const Center(
                              child: Text('No Internet Connection'),
                            );
                          } else {
                            // loading widget
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(isFavorite ? MdiIcons.heart : MdiIcons.heartOutline));
  }
}
