import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('data restaurant list from API successfully fetched', () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
        .thenAnswer((_) async => http.Response(
            '{"error":false,"message":"success","count":20}', 200));

    final restaurantList = await ApiService().topRestaurants(client);
    expect(restaurantList.message, 'success');
  });
}
