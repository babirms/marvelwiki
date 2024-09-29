import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final String imageTitle;

  const AvatarWidget({
    super.key,
    required this.imageUrl,
    required this.imageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.only(right: 12),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 1],
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          imageTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
