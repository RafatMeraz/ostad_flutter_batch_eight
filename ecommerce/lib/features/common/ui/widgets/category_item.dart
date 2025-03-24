import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/features/products/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name,
            arguments: 'Electronics');
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.themeColor.withOpacity(0.15),
            elevation: 0,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.computer,
                size: 48,
                color: AppColors.themeColor,
              ),
            ),
          ),
          const Text(
            'Computers',
            style: TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
