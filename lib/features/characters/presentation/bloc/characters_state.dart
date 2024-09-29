part of 'characters_bloc.dart';

abstract class CharactersState {
  const CharactersState();
}

class LoadingState extends CharactersState {}

// -------------- Get All Characters States ---------------- //
class CharactersPageInitialState extends CharactersState {}

class ErrorGetAllCharactersState extends CharactersState {
  final String errorMsg;

  ErrorGetAllCharactersState(this.errorMsg);
}

class SuccessGetAllCharactersState extends CharactersState {
  final List<CharacterEntity> characters;

  SuccessGetAllCharactersState(this.characters);
}

// -------------- Get Featured Characters States ---------------- //

class ErrorGetFeaturedCharactersState extends CharactersState {
  final String errorMsg;

  ErrorGetFeaturedCharactersState(this.errorMsg);
}

class SuccessGetFeaturedCharactersState extends CharactersState {
  final List<CharacterEntity> characters;

  SuccessGetFeaturedCharactersState(this.characters);
}

// -------------- Get Character Details States ---------------- //

class CharacterDetailsPageInitialState extends CharactersState {}

class ErrorCharacterDetailsState extends CharactersState {
  final String errorMsg;

  ErrorCharacterDetailsState(this.errorMsg);
}

class SuccessCharacterDetailsState extends CharactersState {
  final CharacterEntity characterEntity;

  SuccessCharacterDetailsState(this.characterEntity);
}
