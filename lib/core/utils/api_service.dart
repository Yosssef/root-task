import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<List<Map<String, dynamic>>> get() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');

      // Ensure the response data is of the correct type
      if (response.data is List) {
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Expected a list but got ${response.data.runtimeType}');
      }
    } catch (e) {

      rethrow; // Propagate the error
    }
  }
}
