import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/styles/gradiant_elevation_butoon.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';

class AddNewAccountScreen extends StatelessWidget {
  const AddNewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: Text(
            "Add New Account",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MySizes.defaultSpacing),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: MyColors.primaryColor,
                    decoration: const InputDecoration(
                      prefixIcon: GradientIcon(
                        icon: HugeIcons.strokeRoundedUserAccount,
                        size: MySizes.iconLg,
                      ),
                      label: Text("Account Name"),
                    ),
                  ),
                  ItemSperator.vertical(),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          cursorColor: MyColors.primaryColor,
                          decoration: const InputDecoration(
                            prefixIcon:
                                GradientIcon(icon: HugeIcons.strokeRoundedUser),
                            labelText: "User Name",
                          ),
                        ),
                      ),
                      ItemSperator.halfHorizontal(),
                      Flexible(
                        child: TextFormField(
                          cursorColor: MyColors.primaryColor,
                          decoration: const InputDecoration(
                            prefixIcon: GradientIcon(
                                icon: HugeIcons.strokeRoundedMoney03),
                            labelText: " Initial Amount",
                          ),
                        ),
                      ),
                    ],
                  ),
                  ItemSperator.vertical(),
                  TextFormField(
                    cursorColor: MyColors.primaryColor,
                    decoration: const InputDecoration(
                      prefixIcon: GradientIcon(
                          icon: HugeIcons.strokeRoundedLockPassword),
                      labelText: "Password",
                    ),
                  ),
                  ItemSperator.vertical(),
                  TextFormField(
                      cursorColor: MyColors.primaryColor,
                      decoration: const InputDecoration(
                        prefixIcon:
                            GradientIcon(icon: HugeIcons.strokeRoundedNote),
                        labelText: "Note",
                      )),
                  ItemSperator.doubleVertical(),
                  SizedBox(
                    width: double.infinity,
                    child: GradientElevatedButton(
                      onPressed: () {},
                      child: Text("Save",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: MyColors.dark,
                                  )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
