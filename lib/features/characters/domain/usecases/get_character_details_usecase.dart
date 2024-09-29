import 'package:dartz/dartz.dart';
import 'package:marvelwiki/core/network/failures.dart';
import 'package:marvelwiki/core/usecases/usecase.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';
import 'package:marvelwiki/features/characters/domain/repositories/characters_repository.dart';

class GetAllCharactersUsecase extends UseCase<CharacterEntity, int> {
  final CharactersRepository repository;

  GetAllCharactersUsecase(this.repository);

  @override
  Future<Either<Failure, CharacterEntity>> call(int characterId) async {
    final result = await repository.getCharacterById(characterId: characterId);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
