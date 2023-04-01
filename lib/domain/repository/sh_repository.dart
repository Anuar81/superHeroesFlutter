import '../model/sh_api_response.dart';

abstract class SHRepository {
  Future<SHApiResponse> getCharacters();
}
