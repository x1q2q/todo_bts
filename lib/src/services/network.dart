import 'package:dio/dio.dart';
import 'package:todo_bts/src/utils/constants.dart';

class NetworkService {
  final Dio dio;

  NetworkService() : dio = Dio(BaseOptions(baseUrl: Core.baseURL));
  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw Exception(e.response!.data['message']);
        } else {
          throw Exception('Failed to update data: ${e.response!.data}');
        }
      } else {
        throw Exception('Failed to fetch data: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Response> postData(String endpoint, Map<String, String> data) async {
    dio.options.baseUrl = '';
    try {
      final response = await dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400 ||
            e.response!.statusCode == 403 ||
            e.response!.statusCode == 404 ||
            e.response!.statusCode == 409 ||
            e.response!.statusCode == 500) {
          throw Exception(e.response!.data['message']);
        } else {
          throw Exception('Failed to post data: ${e.response!.data}');
        }
      } else {
        throw Exception('Failed to post data: $e');
      }
    } catch (e) {
      throw Exception('Failed to post data');
    }
  }
}
