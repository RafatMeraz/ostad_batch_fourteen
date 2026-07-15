import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/category_card.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          // return CategoryCard();
        },
        separatorBuilder: (_, _) => SizedBox(width: 8),
      ),
    );
  }
}

