import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/models/meta.dart';

class ModelLive {
  int? status;
  String? message;
  String? endpoint;
  String? method;
  List<ModelMatch>? result;
  ModelMeta? meta;

  ModelLive(
      {this.status,
      this.message,
      this.endpoint,
      this.method,
      this.result,
      this.meta});

  ModelLive.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    endpoint = json['endpoint'];
    method = json['method'];
    if (json['result'] != null) {
      result = <ModelMatch>[];
      json['result'].forEach((v) {
        result!.add(ModelMatch.fromJson(v));
      });
    }
    meta = json['meta'] != null ? ModelMeta.fromJson(json['meta']) : null;
  }
}
