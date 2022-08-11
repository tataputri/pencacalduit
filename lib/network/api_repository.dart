import 'package:dio/dio.dart';
import 'package:firemax_football/models/model_home.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:flutter/material.dart';

class ApiRepository {
  Dio get _dio => Dio(BaseOptions(
        sendTimeout: 60000,
        contentType: 'application/json',
      ));

  Future<ModelValidation?> getValidation() async {
    try {
      Response res = await _dio.get('https://sinop.v-e.info/firemax/main');
    
      if (res.statusCode == 200) {
        return ModelValidation.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      debugPrint("API VALIDATION ERROR : $e");
    }
    return null;
  }

    Future<ModelHome?> getHome() async {
    try {
      Response res = await _dio.get('https://up.asepnews.com/api?apicall2=77577&key=andromob');

      if (res.statusCode == 200) {
        return ModelHome.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      debugPrint("API HOME ERROR : $e");
    }
    return null;
  }
    Future<ModelHome?> getSearch(String keyword) async {
    try {
      Response res = await _dio.get('https://up.asepnews.com/api?apicall2=cari&keyword=$keyword&key=andromob');

      if (res.statusCode == 200) {
        return ModelHome.fromJson(res.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      debugPrint("API HOME ERROR : $e");
    }
    return null;
  }
}
