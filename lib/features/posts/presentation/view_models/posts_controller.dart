import 'package:get/get.dart';
import '../../data/models/posts_model.dart';
import '../../data/repos/posts_repo_impl.dart';

enum PostsState { initial, loading, loaded, error }

class PostsController extends GetxController {
  final PostsRepoImpl postsRepo;

  PostsController(this.postsRepo);

  var posts = <PostModel>[].obs;
  var filteredPosts = <PostModel>[].obs;
  var searchResults = <PostModel>[].obs;
  var state = PostsState.initial.obs;
  var errorMessage = ''.obs;
  int currentPage = 1;
  final int postsPerPage = 10;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts({bool refresh = false}) async {
    if (refresh) {
      currentPage = 1;
    }
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
        if (refresh || filteredPosts.isEmpty) {
          filteredPosts.value = posts.take(postsPerPage).toList();
        }
        loadMore(initialLoad: true);
        state.value = PostsState.loaded;
      },
    );
  }

  void searchPosts(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
    } else {
      state.value = PostsState.loading;
      final result = await postsRepo.searchPosts(query);
      result.fold(
        (failure) {
          state.value = PostsState.error;
          errorMessage.value = failure.errorMessage;
        },
        (data) {
          searchResults.value = data;
          state.value = PostsState.loaded;
        },
      );
    }
  }

  void loadMore({bool initialLoad = false}) {
    if (initialLoad) {
      filteredPosts.value = posts.take(postsPerPage).toList();
    } else {
      int nextItems = (currentPage + 1) * postsPerPage;
      if (nextItems > posts.length) nextItems = posts.length;
      filteredPosts.value = posts.take(nextItems).toList();
      currentPage++;
    }
  }

  void resetSearch() {
    filteredPosts.value = posts.toList();
  }
}
