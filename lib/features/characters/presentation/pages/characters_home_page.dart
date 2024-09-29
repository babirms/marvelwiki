import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_all_characters_usecase.dart';
import 'package:marvelwiki/features/characters/domain/usecases/get_character_details_usecase.dart';
import 'package:marvelwiki/features/characters/presentation/bloc/characters_bloc.dart';
import 'package:marvelwiki/shared/service_locator.dart';

class CharactersHomePage extends StatefulWidget {
  const CharactersHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _CharactersHomePageState();
}

class _CharactersHomePageState extends State<CharactersHomePage> {
  final CharactersBloc _bloc = CharactersBloc(
    getAllCharactersUsecase: Sl.get<GetAllCharactersUsecase>(),
    getCharacterDetailsUsecase: Sl.get<GetCharacterDetailsUsecase>(),
  );

  @override
  void initState() {
    /// Chama o bloc para buscar todos os personagens
    _bloc.add(OnGettingAllCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Image.asset('assets/images/marvel_logo.png'),
        ),
        body: BlocConsumer<CharactersBloc, CharactersState>(
            bloc: _bloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              } else if (state is ErrorGetAllCharactersState) {
                return const Text('Deu erro');
              } else if (state is SuccessGetAllCharactersState) {
                return ListView.builder(
                    itemCount: state.characters.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            state.characters[index].id.toString(),
                          ),
                          Text(' - '),
                          Text(state.characters[index].name.toString()),
                        ],
                      );
                    });
              } else {
                return Container();
              }
            }));
  }
}
