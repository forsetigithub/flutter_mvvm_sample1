
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sample1/myhome_repository.dart';
import 'package:flutter_mvvm_sample1/result_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myHomeViewModelProvider = StateNotifierProvider<MyHomeViewModel,AsyncValue<ResultModel>>((ref) =>
    MyHomeViewModel(repository: ref.watch(myHomeRepositoryProvider)));

class MyHomeViewModel extends StateNotifier<AsyncValue<ResultModel>> {
  MyHomeViewModel({required this.repository}) : super(const AsyncValue.loading()){
    getCount();
  }

  final MyHomeRepository repository;

  Future<void> getCount() async{
    state = const AsyncValue.loading();
    final count = await repository.getCounter();
    state = AsyncValue.data(ResultModel(counter: count));
  }

  void incrementCounter() {
    state = AsyncValue.data(ResultModel(counter: state.value!.counter + 1));
  }
}