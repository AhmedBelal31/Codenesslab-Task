// import 'package:go_router/go_router.dart';
// import '../../features/posts/data/models/posts_model.dart';
// import '../../features/posts/presentation/views/home_view.dart';
// import '../../features/posts/presentation/views/post_details_view.dart';
//
// abstract class AppRouter {
//   static const kHomeView = '/HomeView';
//
//   static const kPostDetailsView = '/PostDetailsView';
//
//   static const kSearchView = '/kSearchView';
//
//   static final router = GoRouter(routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) =>  HomeView(),
//     ),
//     GoRoute(
//       path: kPostDetailsView,
//       builder: (context, state) {
//         final post = state.extra as PostModel;
//         return PostDetailsView(post: post);
//       },
//     ),
//
//     // GoRoute(
//     //   path: kSearchView,
//     //   builder: (context, state) => const SearchView(),
//     // ),
//     // GoRoute(
//     //   path: kHomeView,
//     //   builder: (context, state) => const HomeView(),
//     // ),
//     // GoRoute(
//     //   path: kBookDetailsView,
//     //   builder: (context, state) => BlocProvider(
//     //     create:(context)=>SimilarBookCubit(
//     //       getIt.get<HomeRepoImpl>(),
//     //     ),
//     //     child: BookDetailsView(
//     //       bookModel:state.extra as BookModel,
//     //       //index:int.parse(state.pathParameters['index']!) ,
//     //
//     //     ),
//     //   ),
//     // ),
//   ]);
// }
import 'package:codenesslab_task/features/posts/presentation/views/search_view.dart';
import 'package:get/get.dart';
import '../../features/posts/presentation/views/home_view.dart';
import '../../features/posts/presentation/views/post_details_view.dart';
import '../../features/posts/data/models/posts_model.dart';

abstract class AppRouter {
  static const kPostDetailsView = '/PostDetailsView';
  static const kSearchView = '/kSearchView';

  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () =>  HomeView(),
    ),
    GetPage(
      name: kPostDetailsView,
      page: () {
        final post = Get.arguments as PostModel;
        return PostDetailsView(post: post);
      },
    ),
    GetPage(
      name: kSearchView,
      page: () =>  SearchView(),
    ),
  ];
}
