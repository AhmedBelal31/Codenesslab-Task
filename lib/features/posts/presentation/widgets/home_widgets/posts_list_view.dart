import 'package:codenesslab_task/core/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import '../../../data/models/posts_model.dart';
import 'posts_list_view_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key, required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppConstants.kDefaultPadding / 2),
        child: PostsListViewItem(
          index: index + 1,
          post: posts[index],
        ),
      ),
      itemCount: posts.length,
    );
  }
}
