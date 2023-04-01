import 'package:flutter_sh_test/domain/model/sh_api_response.dart';

import '../repository/sh_repository.dart';

class GetSuperHeroListUseCase {
  final SHRepository repository;

  GetSuperHeroListUseCase(this.repository);

  Future<SHApiResponse> call() async {
    return await repository.getCharacters();
  }
}