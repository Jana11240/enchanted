import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String text;
  final bool? isHighlighted;
  const TabItem({
    super.key,
    required this.text,
    this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: isHighlighted == true
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kPrimaryColor,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: kBodyText.copyWith(
                    color:
                        isHighlighted == true ? Colors.white : kSecondaryColor,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
