
import 'package:flutter/material.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/add_button.dart';

class AddCategoryListTile extends StatelessWidget {
  const AddCategoryListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const AddButton(),
          ItemSperator.halfHorizontal(),
          Text(
            "Add Category",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
