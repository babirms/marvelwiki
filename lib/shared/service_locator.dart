import 'package:get_it/get_it.dart';
import 'package:marvelwiki/features/characters/data/datasources/characteres_remote_datasource.dart';
import 'package:marvelwiki/features/characters/domain/repositories/characters_repository.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_all_characters_usecase.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_character_details_usecase.dart';

final _sl = GetIt.instance;

mixin Sl {
  static GetIt get instance => _sl;

  static T get<T extends Object>() => Sl.instance.get<T>();

  static void init() {
    _sl.registerSingleton<CharacteresRemoteDatasource>(
      CharacteresRemoteDatasourceImpl(),
    );

    _sl.registerSingleton<CharactersRepository>(
      CharactersRepositoryImpl(characteresRemoteDatasource: _sl()),
    );
    _sl.registerSingleton<GetAllCharactersUsecase>(
      GetAllCharactersUsecase(_sl()),
    );
    _sl.registerSingleton<GetCharacterDetailsUsecase>(
      GetCharacterDetailsUsecase(_sl()),
    );
  }
}
