import 'package:codenesslab_task/core/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/services/app_router.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import '../../../data/models/posts_model.dart';

class PostsListViewItem extends StatelessWidget {
  const PostsListViewItem({
    super.key,
    required this.index,
    required this.post,
  });

  final int index;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToDetailsView(context),
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

  void navigateToDetailsView(BuildContext context) {
    Get.toNamed(AppRouter.kPostDetailsView, arguments: post);
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
          vertical: AppConstants.kDefaultPadding / 2,
          horizontal: AppConstants.kDefaultPadding/4),
      child: ListTile(
        leading: _buildIndexText(),
        title: _buildTitleText(),
        subtitle: _buildSubtitleText(),
      ),
    );
  }

  Widget _buildIndexText() {
    return Text(
      '$index',
      style: TextStyles.textStyle20Weight700.copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(post.title,
        style: TextStyles.textStyle16Weight700.copyWith(
          color: Colors.white,
        ));
  }

  Widget _buildSubtitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(post.body,
          style: TextStyles.textStyle14Weight400.copyWith(
            color: Colors.white.withOpacity(.8),
          )),
    );
  }
}
