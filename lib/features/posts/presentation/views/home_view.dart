import 'package:codenesslab_task/core/services/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_constant.dart';
import '../../../../core/utils/theme/app_text_styles.dart';
import '../../../../core/widgets/default_error_message.dart';
import '../../../../core/widgets/default_progress_indicator.dart';
import '../../../../core/widgets/page_bg_decoration.dart';
import '../view_models/posts_controller.dart';
import '../widgets/home_widgets/posts_list_view.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final PostsController postsController = Get.find<PostsController>();

  @override
  Widget build(BuildContext context) {
    postsController.resetSearch();
    return Scaffold(
      body: Container(
        decoration: buildPageBGDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
          child: RefreshIndicator(
            onRefresh: () async {
              await postsController.fetchPosts();
            },
            child: Column(
              children: [
                const SizedBox(height: AppConstants.kDefaultAppBar / 2),
                SlideInDown(
                  duration: const Duration(seconds: 1),
                  child: buildHomeAppBar(),
                ),
                // Inside HomeView class
                Expanded(
                  child: Obx(
                    () {
                      if (postsController.state.value == PostsState.loading) {
                        return const DefaultCircularIndicator();
                      } else if (postsController.state.value ==
                          PostsState.error) {
                        return DefaultErrorMessage(
                            errorMessage: postsController.errorMessage.value);
                      } else {
                        return FadeInUp(
                          duration: const Duration(seconds: 1),
                          child:
                              PostsListView(postsController: postsController),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHomeAppBar() {
    return Row(
      children: [
        Text(
          'Posts',
          style: TextStyles.textStyle20Weight700.copyWith(color: Colors.white),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Get.toNamed(AppRouter.kSearchView);
          },
        ),
      ],
    );
  }
}
