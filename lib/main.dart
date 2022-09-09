import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/ui/restaurant_search.dart';
import 'package:restaurant_app/ui/restaurant_search_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: primaryColor,
              secondary: secondaryColor,
            ),
        scaffoldBackgroundColor: backGroundColor,
        appBarTheme: const AppBarTheme(backgroundColor: backGroundColor),
        iconTheme: const IconThemeData(color: secondaryColor),
        textTheme: basilTheme,
        dividerColor: Colors.grey,
        cardColor: primaryColor3,
      ),
      initialRoute: RestoListPage.routeName,
      routes: {
        RestoListPage.routeName: (context) => const RestoListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
        RestaurantSearchPage.routeName: (context) =>
            const RestaurantSearchPage(),
        RestaurantSearchListPage.routeName: (context) =>
            RestaurantSearchListPage(
              query: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

//developed by T. Zafran Elrifqi