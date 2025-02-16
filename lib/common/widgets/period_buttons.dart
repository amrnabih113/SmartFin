import 'package:flutter/material.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';

class PeriodButtons extends StatelessWidget {
  const PeriodButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 100,
                    child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors.transparent),
                        child: Text(
                          "Daily",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))),
                ItemSperator.halfHorizontal(),
                SizedBox(
                    width: 100,
                    child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: Text(
                          "Monthly",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))),
                ItemSperator.halfHorizontal(),
                SizedBox(
                    width: 100,
                    child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors.transparent),
                        child: Text(
                          "Yearly",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))),
              ]);
  }
}