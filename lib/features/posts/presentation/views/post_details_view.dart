import 'package:flutter/material.dart';
import '../../data/models/posts_model.dart';
import '../widgets/post_details_widgets/post_details_view_body.dart';

class PostDetailsView extends StatelessWidget {
  final PostModel post;

  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageDetailsViewBody(post: post),
    );
  }
}


