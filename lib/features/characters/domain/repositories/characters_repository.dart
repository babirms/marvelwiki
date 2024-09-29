import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marvelwiki/core/network/failures.dart';
import 'package:marvelwiki/features/characters/data/datasources/characteres_remote_datasource.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters();
  Future<Either<Failure, CharacterEntity>> getCharacterById(
      {required int characterId});
}

class CharactersRepositoryImpl implements CharactersRepository {
  final CharacteresRemoteDatasource _characteresRemoteDatasource;

  CharactersRepositoryImpl({
    required CharacteresRemoteDatasource characteresRemoteDatasource,
  }) : _characteresRemoteDatasource = characteresRemoteDatasource;

  @override
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters() async {
    try {
      final result = await _characteresRemoteDatasource.getAllCharacters();
      return Right(result);
    } on DioException catch (e) {
      return Left(
          ApiFailure(e.response?.statusMessage ?? 'Something went wrong.'));
    }
  }

  @override
  Future<Either<Failure, CharacterEntity>> getCharacterById(
      {required int characterId}) async {
    try {
      final result = await _characteresRemoteDatasource.getCharacterById(
          characterId: characterId);
      return Right(result);
    } on DioException catch (e) {
      return Left(
          ApiFailure(e.response?.statusMessage ?? 'Something went wrong.'));
    }
  }
}
