import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clone_intagram/blocs/auth/auth_bloc.dart';
import 'package:flutter_clone_intagram/config/router.dart';
import 'package:flutter_clone_intagram/enums/enums.dart';
import 'package:flutter_clone_intagram/screens/screens.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItems item;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
            settings: RouteSettings(name: tabNavigatorRoot),
            builder: (context) => routeBuilders[initialRoute]!(context),
          )
        ];
      },
       onGenerateRoute: CustomRouter.onGenerateNestedRoute,
    );
  }

  Map<String, WidgetBuilder> _routeBuilders() {
    return {tabNavigatorRoot: (context) => _getScreen(context, item)};
  }

  Widget _getScreen(BuildContext context, BottomNavItems item) {
    switch (item) {
      case BottomNavItems.feed:
        return FeedScreen();
      case BottomNavItems.search:
        return SearchScreen();
      case BottomNavItems.create:
        return CreatePostsScreen();
      case BottomNavItems.notification:
        return NotificationsScreen();
      case BottomNavItems.profile:
        return ProfileScreen();
      default:
        return Scaffold();
    }
  }

  // Widget _getScreen(BuildContext context, BottomNavItems item) {
  //   switch (item) {
  //     case BottomNavItems.feed:
  //       return BlocProvider<FeedBloc>(
  //         create: (context) => FeedBloc(
  //           postRepository: context.read<PostRepository>(),
  //           authBloc: context.read<AuthBloc>(),
  //           likedPostsCubit: context.read<LikedPostsCubit>(),
  //         )..add(FeedFetchPosts()),
  //         child: FeedScreen(),
  //       );
  // case BottomNavItems.search:
  //   return BlocProvider<SearchCubit>(
  //     create: (context) =>
  //         SearchCubit(userRepository: context.read<UserRepository>()),
  //     child: SearchScreen(),
  //   );
  // case BottomNavItems.create:
  //   return BlocProvider<CreatePostCubit>(
  //     create: (context) => CreatePostCubit(
  //       postRepository: context.read<PostRepository>(),
  //       storageRepository: context.read<StorageRepository>(),
  //       authBloc: context.read<AuthBloc>(),
  //     ),
  //     child: CreatePostScreen(),
  //   );
  // case BottomNavItems.notifications:
  //   return BlocProvider<NotificationsBloc>(
  //     create: (context) => NotificationsBloc(
  //       notificationRepository: context.read<NotificationRepository>(),
  //       authBloc: context.read<AuthBloc>(),
  //     ),
  //     child: NotificationsScreen(),
  //   );
  // case BottomNavItems.profile:
  //   return BlocProvider<ProfileBloc>(
  //     create: (_) => ProfileBloc(
  //       userRepository: context.read<UserRepository>(),
  //       postRepository: context.read<PostRepository>(),
  //       authBloc: context.read<AuthBloc>(),
  //       likedPostsCubit: context.read<LikedPostsCubit>(),
  //     )..add(
  //         ProfileLoadUser(userId: context.read<AuthBloc>().state.user.uid),
  //       ),
  //     child: ProfileScreen(),
  //   );
  //     default:
  //       return Scaffold();
  //   }
  // }
}
