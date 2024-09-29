import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvelwiki/features/characters/data/entities/character_data_wrapper_entity.dart';

abstract class CharacteresRemoteDatasource {
  Future<List<CharacterDataWrapperEntity>> getAllCharacters();
  Future<CharacterDataWrapperEntity> getCharacterById(
      {required int characterId});
}

class CharacteresRemoteDatasourceImpl extends CharacteresRemoteDatasource {
  final dio = Dio();

  final String publicKey = dotenv.env['MARVEL_API_PUBLIC_KEY'] ?? '';
  final String privateKey = dotenv.env['MARVEL_API_PRIVATE_KEY'] ?? '';

  final String baseUrl = 'https://gateway.marvel.com:443/v1/public/';

  CharacteresRemoteDatasourceImpl();

  @override
  Future<List<CharacterDataWrapperEntity>> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }

  @override
  Future<CharacterDataWrapperEntity> getCharacterById(
      {required int characterId}) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }
}
