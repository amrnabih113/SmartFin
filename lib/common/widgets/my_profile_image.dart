import 'package:flutter/material.dart';

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.onTap,
    this.radius = 40,
  });

  final String image;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: CircleAvatar(
        radius: radius,
        backgroundImage: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
      ),
    );
  }
}
