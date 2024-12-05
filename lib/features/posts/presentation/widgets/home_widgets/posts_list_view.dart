import 'package:flutter/material.dart';
import '../../view_models/posts_controller.dart';
import 'posts_list_view_item.dart';

class PostsListView extends StatefulWidget {
  const PostsListView({super.key, required this.postsController});

  final PostsController postsController;

  @override
  State<PostsListView> createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      setState(() {
        //print('load more');
        widget.postsController.loadMore();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: PostsListViewItem(
          index: index + 1,
          post: widget.postsController.filteredPosts[index],
        ),
      ),
      itemCount: widget.postsController.filteredPosts.length,
    );
  }
}
