import 'package:flutter_sh_test/domain/model/results.dart';

import '../../../domain/model/sh_api_response.dart';
import '../../../domain/usecases/get_superhero_list_use_case.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final superHeroListProvider = Provider<List<Results>?>((ref) {
  return ref.watch(_superHeroListProvider);
});

final _superHeroListProvider = StateProvider<List<Results>?>((ref) {
  return <Results> [];
});

class HomeViewModel with ChangeNotifier {
  final GetSuperHeroListUseCase getSuperHeroListUseCase;
  final ChangeNotifierProviderRef<HomeViewModel> ref;

  HomeViewModel(this.getSuperHeroListUseCase, this.ref);

  void loadSuperHeroes() {
    getSuperHeroListUseCase().then((response) {
      ref.read(_superHeroListProvider.notifier).state = response.data?.results;
    });
  }
}
