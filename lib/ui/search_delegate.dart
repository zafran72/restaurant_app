// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant_app/data/model/restaurant_search.dart';
// import 'package:restaurant_app/provider/restaurant_search_provider.dart';

// class MySearchDelegate extends SearchDelegate {
// // Demo list to show querying

// // first overwrite to
// // clear the search text
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }

// // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

// // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {
//     return Consumer<RestaurantSearchProvider>(
//       builder: (context, state, _) {
//         if (state.state == ResultState.loading) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           if (state.state == ResultState.hasData) {
//             return ListView(
//               padding: const EdgeInsets.all(8.0),
//               children: const [Text('mesra')],
//             );
//             // success widget
//           } else if (state.state == ResultState.error) {
//             // error widget
//             return Center(
//               child: Text('boboho'),
//             );
//           } else {
//             // loading widget
//             return const Center(child: CircularProgressIndicator());
//           }
//         }
//       },
//     );
//   }

// // last overwrite to show the
// // querying process at the runtime
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const Center(
//       child: Text('Search your favorite restaurant'),
//     );
//   }
// }

// class CardRestaurantSearch extends StatelessWidget {
//   final RestaurantSearching restaurant1;

//   const CardRestaurantSearch({super.key, required this.restaurant1});

//   @override
//   Widget build(BuildContext context) {
//     return Text(restaurant1.name);
//   }
// }
