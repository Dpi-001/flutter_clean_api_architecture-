import 'package:dio/dio.dart';
import 'package:flutter_application_3/constants/api_constants.dart';

class ApiCalls {
  //* get Method
  getData({required String endpoint}) async {
    try {
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl, //api Constrants batw base url
        ),
      );
      final response = await dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }
}
