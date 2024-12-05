import 'package:codenesslab_task/core/error/failures.dart';
import 'package:codenesslab_task/core/utils/constants/api_constants.dart';
import 'package:codenesslab_task/features/posts/data/models/posts_model.dart';
import 'package:codenesslab_task/features/posts/data/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/services/web_services.dart';

class PostsRepoImpl extends PostsRepo {
  final ApiService apiService;

  PostsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<PostModel>>> getAllPosts() async {
    try {
      var result =
          await apiService.getData(endPoint: ApiConstants.postsEndPoint);
      List<PostModel> posts = [];
      for (var post in result) {
        posts.add(PostModel.fromJson(post));
      }
      return right(posts);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> searchPosts(String query) async {
    try {
      var result = await apiService.getData(
        endPoint: ApiConstants.postsEndPoint,
        query: {'q': query},
      );
      List<PostModel> posts = [];
      for (var post in result) {
        posts.add(PostModel.fromJson(post));
      }
      return right(posts);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
