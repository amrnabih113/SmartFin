
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/widgets/my_profile_image.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const MyProfileImage(
                image: MyImages.profileImage,
                radius: 35,
                isNetworkImage: false,
              ),
              ItemSperator.halfHorizontal(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Amr Nabih",
                      style:
                          Theme.of(context).textTheme.titleMedium),
                  Text(
                    "amrnabih112@gmail.com",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const GradientIcon(
              icon: Iconsax.edit,
              size: MySizes.iconLg,
            ),
            onPressed: () {},
          )
        ]);
  }
}
