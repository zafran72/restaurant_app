import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/ui/restaurant_search_list_page.dart';

class RestaurantSearchPage extends StatelessWidget {
  static const routeName = '/restaurant_search';

  const RestaurantSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (_) =>
          RestaurantSearchProvider('makan murah', apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Restaurant'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: NameField()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NameField extends StatefulWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  NameFieldState createState() => NameFieldState();
}

class NameFieldState extends State<NameField> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            style: const TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: "Input restaurant name, menu, or category",
              hintStyle: TextStyle(
                color: primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: (String value) {
              setState(() {
                _query = value;
              });
            },
          ),
        ),
        SizedBox(
          width: 160.0,
          height: 35.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFFFD5523),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, RestaurantSearchListPage.routeName,
                  arguments: _query);
            },
            child: const Text(
              "Search",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
