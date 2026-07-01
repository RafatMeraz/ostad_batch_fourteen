import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../products/presentation/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.name,
          arguments: 'product-id',
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        color: Colors.white,
        shadowColor: AppColors.themeColor.withAlpha(40),
        elevation: 2,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(30),
                  borderRadius: .only(
                    topLeft: .circular(8),
                    topRight: .circular(8),
                  ),
                ),
                child: Image.asset(AssetPaths.dummyPng),
              ),
              Padding(
                padding: const .all(8.0),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Title of product',
                      style: TextStyle(
                        fontWeight: .w600,
                        color: Colors.black54,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          '\$100',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Wrap(
                          spacing: 4,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            Text('4.5'),
                          ],
                        ),
                        Container(
                          padding: .all(2),
                          decoration: BoxDecoration(
                            borderRadius: .circular(4),
                            color: AppColors.themeColor,
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
