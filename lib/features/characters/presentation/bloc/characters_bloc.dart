import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelwiki/core/usecases/noparams.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_all_characters_usecase.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_character_details_usecase.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_featured_characters_usecase.dart';

part 'characters_event.dart';

part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetAllCharactersUsecase getAllCharactersUsecase;
  final GetCharacterDetailsUsecase getCharacterDetailsUsecase;
  final GetFeaturedCharactersUsecase getFeaturedCharactersUsecase;

  CharactersBloc(
      {required this.getAllCharactersUsecase,
      required this.getCharacterDetailsUsecase,
      required this.getFeaturedCharactersUsecase})
      : super(LoadingState()) {
    on<OnGettingAllCharactersEvent>(onGettingAllCharactersEvent);
    on<OnGettingCharacterDetailsEvent>(onGettingCharacterDetailsEvent);
    on<OnGettingFeaturedCharactersEvent>(onGettingFeaturedCharactersEvent);
  }

  onGettingAllCharactersEvent(OnGettingAllCharactersEvent event,
      Emitter<CharactersState> emitter) async {
    emitter(LoadingState());

    final result = await getAllCharactersUsecase.call(NoParams());

    result.fold((left) {
      emitter(ErrorGetAllCharactersState(left.errorMessage));
    }, (right) {
      emitter(SuccessGetAllCharactersState(right));
    });
  }

  onGettingCharacterDetailsEvent(OnGettingCharacterDetailsEvent event,
      Emitter<CharactersState> emitter) async {
    emitter(LoadingState());

    final result = await getCharacterDetailsUsecase.call(event.characterId);

    result.fold((left) {
      emitter(ErrorCharacterDetailsState(left.errorMessage));
    }, (right) {
      emitter(SuccessCharacterDetailsState(right));
    });
  }

  onGettingFeaturedCharactersEvent(OnGettingFeaturedCharactersEvent event,
      Emitter<CharactersState> emitter) async {
    emitter(LoadingState());

    final result = await getFeaturedCharactersUsecase.call(NoParams());

    result.fold((left) {
      emitter(ErrorGetFeaturedCharactersState(left.errorMessage));
    }, (right) {
      emitter(SuccessGetFeaturedCharactersState(right));
    });
  }
}
