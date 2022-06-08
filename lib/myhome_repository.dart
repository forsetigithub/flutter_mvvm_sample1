
import 'package:flutter_mvvm_sample1/result_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IMyHomeRepository {
  Future<int> getCounter();
}

class MyHomeRepository implements IMyHomeRepository {
  MyHomeRepository({required this.model});

  final ResultModel model;

  @override
  Future<int> getCounter() async{
    return Future.value(model.counter);
  }
}

final myHomeRepositoryProvider = Provider((ref) => MyHomeRepository(model:ResultModel(counter: 0)));