import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../features/posts/data/repos/posts_repo_impl.dart';
import '../../features/posts/presentation/view_models/posts_controller.dart';
import '../services/web_services.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => ApiService(Get.find<Dio>()));
    Get.lazyPut(() => PostsRepoImpl(Get.find<ApiService>()));
    Get.lazyPut(() => PostsController(Get.find<PostsRepoImpl>()));
  }
}
