import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/sh_repository_impl.dart';
import '../domain/repository/sh_repository.dart';
import '../domain/usecases/get_superhero_list_use_case.dart';
import '../ui/screen/home/home_viewmodel.dart';

final shRepositoryProvider = Provider<SHRepository>((ref) => SHRepositoryImpl());

final getSuperHeroListUseCaseProvider = Provider<GetSuperHeroListUseCase>((ref) {
  final repository = ref.read(shRepositoryProvider);
  return GetSuperHeroListUseCase(repository);
});

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final getSuperHeroListUseCase = ref.read(getSuperHeroListUseCaseProvider);
  return HomeViewModel(getSuperHeroListUseCase, ref);
});
