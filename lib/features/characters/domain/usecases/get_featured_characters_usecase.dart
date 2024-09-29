import 'package:dartz/dartz.dart';
import 'package:marvelwiki/core/network/failures.dart';
import 'package:marvelwiki/core/usecases/noparams.dart';
import 'package:marvelwiki/core/usecases/usecase.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';
import 'package:marvelwiki/features/characters/domain/repositories/characters_repository.dart';
import 'package:marvelwiki/shared/featured_characters_list.dart';

class GetFeaturedCharactersUsecase
    extends UseCase<List<CharacterEntity>, NoParams> {
  final CharactersRepository repository;

  GetFeaturedCharactersUsecase(this.repository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(NoParams params) async {
    List<CharacterEntity> characters = [];

    for (final id in FeaturedCharactersList.featuredCharactersIdFromAPI) {
      /// Recupera o personagem pelo id
      final result = await repository.getCharacterById(characterId: id);

      /// Se der erro, encerra a execução, se der certo, adiciona o personagem na lista
      result.fold((l) => Left(l), (r) => characters.add(r));
    }

    /// Retorna a lista
    return Right(characters);
  }
}
