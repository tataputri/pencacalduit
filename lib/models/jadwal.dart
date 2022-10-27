import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/models/meta.dart';

class ModelJadwal {
  int? status;
  String? message;
  String? endpoint;
  String? method;
  List<Result>? result;
  ModelMeta? meta;

  ModelJadwal(
      {this.status,
      this.message,
      this.endpoint,
      this.method,
      this.result,
      this.meta});

  ModelJadwal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    endpoint = json['endpoint'];
    method = json['method'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    meta = json['meta'] != null ? ModelMeta.fromJson(json['meta']) : null;
  }
}

class Result {
  String? leagueName;
  List<ModelMatch>? match;

  Result({this.leagueName, this.match});

  Result.fromJson(Map<String, dynamic> json) {
    leagueName = json['league_name'];
    if (json['match'] != null) {
      match = <ModelMatch>[];
      json['match'].forEach((v) {
        match!.add(ModelMatch.fromJson(v));
      });
    }
  }
}
