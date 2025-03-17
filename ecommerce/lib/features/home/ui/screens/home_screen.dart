import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/core/extensions/localization_extension.dart';
import 'package:ecommerce/features/home/ui/widgets/app_bar_action_button.dart';
import 'package:ecommerce/features/home/ui/widgets/category_item.dart';
import 'package:ecommerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce/features/home/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchTextField(),
            const SizedBox(height: 16),
            const HomeCarouselSlider(),
            const SizedBox(height: 16),
            SectionHeader(
              title: context.localization.categories,
              onTapSeeAll: () {},
            ),
            const SizedBox(height: 16),
            _buildCategoriesSection()
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNavSvg),
      actions: [
        AppBarActionButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
