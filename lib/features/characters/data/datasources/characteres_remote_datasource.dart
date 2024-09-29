import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class CharacteresRemoteDatasource {
  Future<dynamic> getAllCharacters();
  Future<dynamic> getCharacterById({required int characterId});
}

class CharacteresRemoteDatasourceImpl extends CharacteresRemoteDatasource {
  final dio = Dio();

  final String publicKey = dotenv.env['MARVEL_API_PUBLIC_KEY'] ?? '';
  final String privateKey = dotenv.env['MARVEL_API_PRIVATE_KEY'] ?? '';

  final String baseUrl = 'https://gateway.marvel.com:443/v1/public/';

  CharacteresRemoteDatasourceImpl();

  @override
  Future getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }

  @override
  Future getCharacterById({required int characterId}) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }
}
