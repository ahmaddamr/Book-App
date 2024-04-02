import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio = Dio();
  Future<Map<String, dynamic>> getRequest({required String url}) async {
    var response = await dio.get('$baseUrl$url');
    return response.data;
  }
}
