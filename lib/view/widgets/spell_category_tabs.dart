import 'package:enchanted/view/styling.dart';
import 'package:enchanted/view/widgets/spell_category_tab_item.dart';
import 'package:flutter/material.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({
    super.key,
    required this.types,
    required this.onCategoryChosen,
  });

  final Iterable<String> types;
  final void Function(int categoryIndex) onCategoryChosen;

  @override
  State<CategoryTabs> createState() => _TabsState();
}

class _TabsState extends State<CategoryTabs> {
  int _highlightedCategoryId = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 40,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned.fill(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 15),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.types.length,
                itemBuilder: (BuildContext context, int index) {
                  final categoryText = widget.types.elementAt(index);
                  return InkWell(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    onTap: () {
                      setState(() {
                        _highlightedCategoryId = index;
                        widget.onCategoryChosen(index);
                      });
                    },
                    child: TabItem(
                      text: categoryText,
                      isHighlighted: _highlightedCategoryId == index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
