import 'package:flutter/material.dart';
import 'package:marvelwiki/core/ui/avatar_widget.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';

class FeaturedCharactersSectionWidget extends StatelessWidget {
  final List<CharacterEntity> featuredCharacters;

  const FeaturedCharactersSectionWidget({
    super.key,
    required this.featuredCharacters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FEATURED CHARACTERS',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredCharacters.length,
                itemBuilder: (context, index) {
                  return AvatarWidget(
                    imageUrl:
                        '${featuredCharacters[index].thumbnail!.path}.${featuredCharacters[index].thumbnail!.extension}',
                    imageTitle: '${featuredCharacters[index].name}',
                  );
                }),
          )
        ],
      ),
    );
  }
}
