import 'package:dio/dio.dart';
import 'package:template_spam_playtore/network/api_constant.dart';

class ApiRepository {
  Dio get _dio => Dio(BaseOptions(
        baseUrl: ApiConstants.BASE_URL,
        sendTimeout: 60000,
        contentType: 'application/json',
      ));

  Future<dynamic> getValidation() async {
    try {
      Response res = await _dio.get('');
      if (res.statusCode == 200) {
        return res.data;
      } else {
        return null;
      }
    } catch (e) {
      return Exception(e);
    }
  }
}
