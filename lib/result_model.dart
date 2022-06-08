
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'result_model.freezed.dart';

@freezed
class ResultModel with _$ResultModel {
  factory ResultModel({required int counter}) = _ResultModel;
}

final resultModelProvider = Provider<ResultModel>((ref) =>  ResultModel(counter: 0));