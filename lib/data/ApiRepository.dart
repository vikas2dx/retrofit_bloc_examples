import 'package:dio/dio.dart';
import 'package:retrofit_examples/Apis.dart';
import 'package:retrofit_examples/data.dart';

class ApiRepository {
  static ApiRepository _apiRepository = ApiRepository._private();
  ApiClient apiClient;

  factory ApiRepository() {
    return _apiRepository;
  }

  ApiRepository._private() {
    apiClient = _createClient();
  }

  ApiClient _createClient() {
    Dio _dio = Dio();
    _dio.options.contentType = "application/json";
    _dio.options.connectTimeout = 30 * 1000;
    return ApiClient(_dio);
  }

  Future<ResponseData> getUsers() async {
    var response = await apiClient.getUsers();
    return response;
  }
}
