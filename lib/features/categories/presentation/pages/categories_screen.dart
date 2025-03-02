import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/widgets/category_icon_container.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/categories/domain/entities/category_section_entity.dart';
import 'package:smartFin/features/categories/presentation/controllers/categories_controller.dart';
import 'package:smartFin/generated/l10n.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesController = Get.put(CategoriesController(
      sl(),
      sl(),
    ));
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(AppLocalizations.current.categories,
            style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const GradientIcon(
                  icon: HugeIcons.strokeRoundedAdd01, size: 25),
              iconSize: 15)
        ],
      ),
      body: Obx(() {
        final List<CategorySectionEntity> categories =
            categoriesController.categorySections;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MySizes.defaultSpacing),
            child: Column(
              children: [
                const TextField(
                  cursorColor: MyColors.primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(HugeIcons.strokeRoundedSearch02),
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                  ),
                ),
                SectionSeperator.vertical(),
                ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        MySectionHeading(
                          title: categories[i].title,
                          style: Theme.of(context).textTheme.titleSmall,
                          showActionButton: true,
                        ),
                        ItemSperator.vertical(),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (_, j) {
                            final category = categories[i].categories[j];
                            return Column(
                              children: [
                                CategoryIconContainer(
                                  color: category.materialColor,
                                  icon: category.iconData,
                                  paddingValue: MySizes.md,
                                  size: 30,
                                ),
                                ItemSperator.halfVertical(),
                                Text(
                                  category.name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            );
                          },
                          itemCount: categories[i].categories.length,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
