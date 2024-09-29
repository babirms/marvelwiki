import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelwiki/core/ui/avatar_widget.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_all_characters_usecase.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_character_details_usecase.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_featured_characters_usecase.dart';
import 'package:marvelwiki/features/characters/presentation/bloc/characters_bloc.dart';
import 'package:marvelwiki/shared/service_locator.dart';

class FeaturedCharactersSectionWidget extends StatefulWidget {
  const FeaturedCharactersSectionWidget({super.key});

  @override
  State<StatefulWidget> createState() =>
      _FeaturedCharactersSectionWidgetState();
}

class _FeaturedCharactersSectionWidgetState
    extends State<FeaturedCharactersSectionWidget> {
  final CharactersBloc _bloc = CharactersBloc(
    getAllCharactersUsecase: Sl.get<GetAllCharactersUsecase>(),
    getCharacterDetailsUsecase: Sl.get<GetCharacterDetailsUsecase>(),
    getFeaturedCharactersUsecase: Sl.get<GetFeaturedCharactersUsecase>(),
  );

  @override
  void initState() {
    /// Chama o bloc para buscar os personagens em destaque
    /// TODO: repensar o fluxo (lentidão)
    _bloc.add(OnGettingFeaturedCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersBloc, CharactersState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return const CircularProgressIndicator();
        } else if (state is ErrorGetFeaturedCharactersState) {
          return const Text('Deu erro');
        } else if (state is SuccessGetFeaturedCharactersState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FEATURED CHARACTERS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        return AvatarWidget(
                          imageUrl:
                              '${state.characters[index].thumbnail!.path}.${state.characters[index].thumbnail!.extension}',
                          imageTitle: '${state.characters[index].name}',
                        );
                      }),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
