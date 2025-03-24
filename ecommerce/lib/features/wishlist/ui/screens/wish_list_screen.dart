import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/common/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.wishlist),
      ),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          return const FittedBox(child: ProductCard());
        },
      ),
    );
  }
}
