import 'package:flutter/material.dart';

class UserCircleImage extends StatelessWidget {
  const UserCircleImage(
      {Key? key, required this.imgUrl, required this.diameter})
      : super(key: key);

  final String imgUrl;
  final double diameter;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          shape: BoxShape.circle,
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/profil.jpg'))),
    );
  }
}
