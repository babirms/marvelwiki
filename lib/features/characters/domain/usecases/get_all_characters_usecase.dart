import 'package:dartz/dartz.dart';
import 'package:marvelwiki/core/network/failures.dart';
import 'package:marvelwiki/core/usecases/noparams.dart';
import 'package:marvelwiki/core/usecases/usecase.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';
import 'package:marvelwiki/features/characters/domain/repositories/characters_repository.dart';

class GetAllCharactersUsecase extends UseCase<List<CharacterEntity>, NoParams> {
  final CharactersRepository repository;

  GetAllCharactersUsecase(this.repository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(NoParams params) async {
    final result = await repository.getAllCharacters();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
