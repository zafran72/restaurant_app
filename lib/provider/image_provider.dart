// import 'package:flutter/foundation.dart';
// import 'package:restaurant_app/data/api/api_service.dart';
// import 'package:restaurant_app/data/model/image.dart';

// enum ResultState { loading, noData, hasData, error }

// class ImageProvider extends ChangeNotifier {
//   final ApiService apiService;

//   final String pictureId;

//   ImageProvider(this.pictureId, {required this.apiService}) {
//     _fetchAllImage();
//   }

//   late ImageId _imageId;
//   late ResultState _state;
//   String _message = '';

//   String get message => _message;

//   ImageId get result => _imageId;

//   ResultState get state => _state;

//   Future<dynamic> _fetchAllImage() async {
//     try {
//       _state = ResultState.loading;
//       notifyListeners();
//       final image = await apiService.restaurantImage(pictureId);
//       if (image.url.isEmpty) {
//         _state = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _state = ResultState.hasData;
//         notifyListeners();
//         return _imageId = image;
//       }
//     } catch (e) {
//       _state = ResultState.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
// }
