import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(fontSize: 24),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(context.localization.seeAll),
        )
      ],
    );
  }
}
