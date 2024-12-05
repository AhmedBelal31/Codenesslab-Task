import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_constant.dart';
import '../../../../core/widgets/page_bg_decoration.dart';
import '../view_models/posts_controller.dart';
import '../widgets/home_widgets/search_posts_list_view.dart';
import '../widgets/home_widgets/search_row.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final PostsController postsController = Get.find<PostsController>();

  @override
  Widget build(BuildContext context) {
    postsController.resetSearch();

    return Scaffold(
      body: Container(
        decoration: buildPageBGDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
          child: Column(
            children: [
              const SizedBox(height: AppConstants.kDefaultAppBar),
              SearchRow(
                onSearch: (query) {
                  postsController.searchPosts(query);
                },
              ),
              Expanded(
                child: Obx(() {
                  if (postsController.state.value == PostsState.loading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.white));
                  } else if (postsController.state.value == PostsState.error) {
                    return Center(
                      child: Text(
                        postsController.errorMessage.value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return SearchPostsListView(
                        posts: postsController.searchResults);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
