import 'package:firemax_football/models/detail.dart';
import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/models/model_home.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/models/today.dart';

class ModelRoute {
  final String? data1;
  final int? index;
  final ModelValidation? modelValidation;
  final DataBola? data;
  final List<ModelMatch>? listMatch;
  final ModelMatch? modelMatch;
  final ModelToday? modelToday;
  final ModelDetail? modelDetail;
  ModelRoute({
    this.listMatch,
    this.modelMatch,
    this.modelToday,
    this.index,
    this.modelValidation,
    this.data1,
    this.data,
    this.modelDetail,
  });
}
