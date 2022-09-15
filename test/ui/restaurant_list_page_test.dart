import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<RestaurantProvider>(
      create: (context) => RestaurantProvider(apiService: ApiService()),
      child: const MaterialApp(
        home: RestoListPage(),
      ),
    );

void main() {
  group('Restaurant List Page Widget', () {
    testWidgets('Testing if IconButton shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}
