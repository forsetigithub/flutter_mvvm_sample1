
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample1/myhome_repository.dart';
import 'package:flutter_mvvm_sample1/result_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myHomeViewModelProvider = StateNotifierProvider<MyHomeViewModel,ResultModel>((ref) =>
    MyHomeViewModel(repository: ref.watch(myHomeRepositoryProvider)));

class MyHomeViewModel extends StateNotifier<ResultModel> {
  MyHomeViewModel({required this.repository}) : super(ResultModel(counter: 0));

  final MyHomeRepository repository;

  Future<void> getCount() async{
    state = state.copyWith(counter: await repository.getCounter());
  }

  void incrementCounter(){
    state = state.copyWith(counter:state.counter + 1);
  }
}