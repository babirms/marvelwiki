part of 'characters_bloc.dart';

abstract class CharactersEvent {
  const CharactersEvent();
}

class OnGettingAllCharactersEvent extends CharactersEvent {
  OnGettingAllCharactersEvent();
}

class OnGettingCharacterDetailsEvent extends CharactersEvent {
  final int characterId;

  OnGettingCharacterDetailsEvent(this.characterId);
}
