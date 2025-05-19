import 'package:dio/dio.dart';
import 'package:flutter_application_3/constants/api_constants.dart';
import 'package:flutter_application_3/core/api/dio_exception.dart';

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
      throw CustomDioException.fromDioError(
        e,
      ); // CustomDioException is a class that handles dio exceptions
    }
  }

  //send data
  sendData({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl));
      final response = await dio.post(endpoint, data: data);
      return response.data; //response.data will show the sucess info
    } on DioException catch (e) {
      throw CustomDioException.fromDioError(e);
    }
  }
}
