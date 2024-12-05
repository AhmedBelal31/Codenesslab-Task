import 'package:codenesslab_task/features/posts/data/models/posts_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<PostModel>>> getAllPosts();

  Future<Either<Failure, List<PostModel>>> searchPosts(String query);
}
