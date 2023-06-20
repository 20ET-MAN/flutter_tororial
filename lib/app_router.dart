import 'package:auto_route/auto_route.dart';
import 'package:flutter_demo_proj/domain/entity/todo_entity.dart';
import 'package:flutter_demo_proj/presentation/travel/travel_detail/travel_detail_screen.dart';
import 'package:flutter_demo_proj/presentation/travel/travel_home/travel_home_screen.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
/*   AutoRoute(page: TodoDetailProvider.page),
   AutoRoute(page: TodoListProv.page, initial: true),*/
        AutoRoute(
          path: '/dashboard',
          page: TravelBottomNavigationBar.page,
          initial: true,
          children: [
            AutoRoute(path: 'main', page: TravelHomeRoute.page),
            AutoRoute(path: 'liked', page: TravelLikeRoute.page),
            AutoRoute(path: 'message', page: TravelMessageRoute.page),
            AutoRoute(path: 'settings', page: TravelSettingRoute.page),

          ],
        ),
    AutoRoute(page: TravelDetailRoute.page)
      ];
}
