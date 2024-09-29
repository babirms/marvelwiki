import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvelwiki/core/exceptions/api_exceptions.dart';
import 'package:marvelwiki/features/characters/data/entities/character_data_wrapper_entity.dart';

import 'package:crypto/crypto.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';

abstract class CharacteresRemoteDatasource {
  Future<List<CharacterEntity>> getAllCharacters();
  Future<CharacterEntity> getCharacterById({required int characterId});
}

class CharacteresRemoteDatasourceImpl extends CharacteresRemoteDatasource {
  final dio = Dio();

  final String publicKey = dotenv.env['MARVEL_API_PUBLIC_KEY'] ?? '';
  final String privateKey = dotenv.env['MARVEL_API_PRIVATE_KEY'] ?? '';

  final String baseUrl = 'https://gateway.marvel.com:443/v1/public';

  CharacteresRemoteDatasourceImpl();

  String apiAauthParams() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    final hash =
        md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString();

    return '?&ts=$timestamp&apikey=$publicKey&hash=$hash';
  }

  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    try {
      final response = await dio.get('$baseUrl/characters${apiAauthParams()}');

      /// Converter o json em [CharacterDataWrapperEntity]
      final CharacterDataWrapperEntity characterDataWrapperEntity =
          CharacterDataWrapperEntity.fromJson(response.data);

      if (characterDataWrapperEntity.data == null) {
        throw DataNotFound(message: 'Data not found');
      }

      return characterDataWrapperEntity.data!.results ?? [];
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw NotAuthorizedException(
            message: e.response?.statusMessage ?? 'Unauthorized');
      }
      if (e.response?.statusCode == 409) {
        throw WrongOrInvalidParamException(
            message: e.response?.statusMessage ?? 'Something went wrong.');
      }
      rethrow;
    }
  }

  @override
  Future<CharacterEntity> getCharacterById({required int characterId}) async {
    try {
      final response =
          await dio.get('$baseUrl/characters/$characterId${apiAauthParams()}');

      /// Converter o json em [CharacterDataWrapperEntity]
      final CharacterDataWrapperEntity characterDataWrapperEntity =
          CharacterDataWrapperEntity.fromJson(response.data);

      if (characterDataWrapperEntity.data == null ||
          characterDataWrapperEntity.data!.results == null) {
        throw DataNotFound(message: 'Data not found');
      }

      return characterDataWrapperEntity.data!.results!.first;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw NotAuthorizedException(
            message: e.response?.statusMessage ?? 'Unauthorized');
      }
      if (e.response?.statusCode == 409) {
        throw WrongOrInvalidParamException(
            message: e.response?.statusMessage ?? 'Something went wrong.');
      }
      rethrow;
    }
  }
}
