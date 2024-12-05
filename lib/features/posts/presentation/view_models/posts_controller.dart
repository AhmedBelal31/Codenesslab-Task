import 'package:get/get.dart';
import '../../data/models/posts_model.dart';
import '../../data/repos/posts_repo_impl.dart';

enum PostsState { initial, loading, loaded, error }

class PostsController extends GetxController {
  final PostsRepoImpl postsRepo;

  PostsController(this.postsRepo);

  var posts = <PostModel>[].obs;
  var filteredPosts = <PostModel>[].obs;
  var state = PostsState.initial.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
    filteredPosts.value = [];
  }

  Future<void> fetchPosts() async {
    state.value = PostsState.loading;

    final result = await postsRepo.getAllPosts();

    result.fold(
      (failure) {
        state.value = PostsState.error;
        errorMessage.value = failure.errorMessage;
      },
      (data) {
        posts.value = data;

        posts.shuffle();

        filteredPosts.value = [];
        state.value = PostsState.loaded;
      },
    );
  }

  void searchPosts(String query) async {
    if (query.isEmpty) {
      filteredPosts.value = [];
    } else {
      state.value = PostsState.loading;
      final result = await postsRepo.searchPosts(query);
      result.fold(
        (failure) {
          state.value = PostsState.error;
          errorMessage.value = failure.errorMessage;
        },
        (data) {
          filteredPosts.value = data;
          state.value = PostsState.loaded;
        },
      );
    }
  }

  void resetSearch() {
    filteredPosts.value = [];
  }
}
