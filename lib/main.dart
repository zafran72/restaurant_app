import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/model/restaurant_list_model.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/preferences/preference_helper.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/ui/home_page.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/ui/restaurant_search.dart';
import 'package:restaurant_app/ui/restaurant_search_list_page.dart';
import 'package:restaurant_app/utils/background_service.dart';
import 'package:restaurant_app/utils/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferencesProvider>(builder: (context, provider, child) {
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
          navigatorKey: navigatorKey,
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => const HomePage(),
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
      }),
    );
  }
}

//developed by T. Zafran Elrifqi