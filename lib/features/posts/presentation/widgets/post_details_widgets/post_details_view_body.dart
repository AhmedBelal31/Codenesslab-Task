import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // استيراد حزمة animate_do
import '../../../../../core/utils/constants/app_constant.dart';
import '../../../../../core/utils/theme/app_text_styles.dart';
import '../../../../../core/widgets/page_bg_decoration.dart';
import '../../../data/models/posts_model.dart';
import 'post_details_widget.dart';

class PageDetailsViewBody extends StatelessWidget {
  final PostModel post;

  const PageDetailsViewBody({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: buildPageBGDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppConstants.kDefaultAppBar / 2),
              FadeInDown(
                duration: const Duration(seconds: 1),
                child: buildAppbar(context),
              ),
              const SizedBox(height: AppConstants.kDefaultSizedBox * 6),
              Padding(
                padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
                child: FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: PostDetailsWidget(
                    post: post,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildAppbar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          'Post Details',
          style: TextStyles.textStyle20Weight700.copyWith(color: Colors.white),
        ),
        const Spacer(),
      ],
    );
  }
}
