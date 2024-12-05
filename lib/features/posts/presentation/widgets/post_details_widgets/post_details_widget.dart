import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_constant.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import '../../../data/models/posts_model.dart';

class PostDetailsWidget extends StatelessWidget {
  final PostModel post;

  const PostDetailsWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.indigoTwilight,
        borderRadius: BorderRadius.circular(AppConstants.kDefaultRadius + 8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.kDefaultRadius + 8),
        child: Stack(
          children: [
            _buildBackground(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.3,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff737373),
                Color(0xffD9D9D9),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppConstants.kDefaultPadding * 4,
          horizontal: AppConstants.kDefaultPadding),
      child: Column(
        children: [
          _buildTitleText(),
          const SizedBox(height: AppConstants.kDefaultSizedBox * 4),
          _buildSubtitleText(),
          const SizedBox(height: AppConstants.kDefaultSizedBox * 4),
        ],
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      post.title,
      style: TextStyles.textStyle16Weight700.copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget _buildSubtitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        post.body,
        style: TextStyles.textStyle14Weight400.copyWith(
          color: Colors.white.withOpacity(.8),
        ),
      ),
    );
  }
}
