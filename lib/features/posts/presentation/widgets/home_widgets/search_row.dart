import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';

class SearchRow extends StatelessWidget {
  final Function(String)? onSearch;

  const SearchRow({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          _buildBackgroundLayer(),
          _buildSearchContent(),
        ],
      ),
    );
  }

  Widget _buildBackgroundLayer() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.3,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                AppColors.lightGrey,
                AppColors.white,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchContent() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Row(
        children: [
          const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: onSearch, // Trigger search on every character typed
              decoration: InputDecoration(
                hintText: 'Search posts...',
                hintStyle: TextStyles.textStyle16Weight400
                    .copyWith(color: Colors.white),
                border: InputBorder.none,
              ),
              style:
                  TextStyles.textStyle16Weight400.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
