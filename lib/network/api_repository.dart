import 'package:dio/dio.dart';
import 'package:firemax_football/models/channel.dart';
import 'package:firemax_football/models/jadwal.dart';
import 'package:firemax_football/models/live.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/models/score.dart';
import 'package:firemax_football/models/search.dart';
import 'package:firemax_football/models/today.dart';
import 'package:firemax_football/network/api_constant.dart';

class ApiRepository {
  Dio get _dio => Dio(BaseOptions(
        sendTimeout: 60000,
        contentType: 'application/json',
        baseUrl: ApiConstants.BASE_URL,
      ));

  Future<ModelValidation?> getValidation() async {
    try {
      // Response res = await _dio.get('https://sinop.v-e.info/firemax/main');
      // Response res = await _dio.get('https://sinop.v-e.info/firemax2023/main');
      // Response res = await _dio.get('https://sinop.v-e.info/firemaxv2/main');
      Response res = await _dio.get(ApiConstants.Auth);

      if (res.statusCode == 200) {
        return ModelValidation.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (_) {
      return null;
    }
  }

  Future<ModelSearch?> getSearch(String keyword, String page) async {
    var gmt = DateTime.now().toLocal().timeZoneOffset.inHours;
    try {
      Response res =
          await _dio.get("${ApiConstants.Search}/$keyword?page=$page&gmt=$gmt");
      if (res.statusCode == 200) {
        return ModelSearch.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      Exception(e.toString());
    }
    return null;
  }

  Future<ModelLive?> getLive() async {
    var gmt = DateTime.now().toLocal().timeZoneOffset.inHours;
    try {
      Response res = await _dio.get("${ApiConstants.Live}?gmt=$gmt");
      if (res.statusCode == 200) {
        return ModelLive.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      Exception(e.toString());
    }
    return null;
  }

  Future<ModelToday?> getToday(String page) async {
    var gmt = DateTime.now().toLocal().timeZoneOffset.inHours;
    try {
      Response res = await _dio.get("${ApiConstants.Today}/$page?gmt=$gmt");
      if (res.statusCode == 200) {
        return ModelToday.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      Exception(e.toString());
    }
    return null;
  }

  Future<ModelJadwal?> getJadwal(String date, String page) async {
    var gmt = DateTime.now().toLocal().timeZoneOffset.inHours;
    try {
      Response res =
          await _dio.get("${ApiConstants.Jadwal}/$date/$page?gmt=$gmt");
      if (res.statusCode == 200) {
        return ModelJadwal.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      Exception(e.toString());
    }
    return null;
  }

  Future<ModelScore?> getScore(String date, String page) async {
    var gmt = DateTime.now().toLocal().timeZoneOffset.inHours;
    try {
      Response res =
         await _dio.get("${ApiConstants.Jadwal}/$date/$page?gmt=$gmt");
      if (res.statusCode == 200) {
        return ModelScore.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (_) {
      return null;
    }
  }

  Future<ModelChannel?> getChannel() async {
    try {
      Response res = await _dio.get(ApiConstants.Channel);

      if (res.statusCode == 200) {
        return ModelChannel.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (_) {
      return null;
    }
  }
}
