import '../../domain/model/sh_api_response.dart';
import '../../domain/repository/sh_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class SHRepositoryImpl implements SHRepository {
  final String _privateKey = 'dcca949708ec8a3a3b97cf51cacf65cd98a314c4';
  final String _publicKey = 'fea4ddbf370376865724c2b03db5ffef';
  final String _baseUrl = 'https://gateway.marvel.com:443/v1/public/characters';

  @override
  Future<SHApiResponse> getCharacters() async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final String hash = md5
        .convert(utf8.encode('$timestamp$_privateKey$_publicKey'))
        .toString();
    final Uri url = Uri.parse('$_baseUrl?apikey=$_publicKey&hash=$hash&ts=$timestamp');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final SHApiResponse shApiResponse = SHApiResponse.fromJson(data);
      return shApiResponse;
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }
}




