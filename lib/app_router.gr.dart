// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter_demo_proj/domain/entity/todo_entity.dart' as _i10;
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_detail/todo_detail_prov.dart'
    as _i1;
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_list/todo_list_prov.dart'
    as _i2;
import 'package:flutter_demo_proj/presentation/travel/travel_bottom_navigation_bar.dart'
    as _i3;
import 'package:flutter_demo_proj/presentation/travel/travel_detail/travel_detail_screen.dart'
    as _i4;
import 'package:flutter_demo_proj/presentation/travel/travel_home/travel_home_screen.dart'
    as _i5;
import 'package:flutter_demo_proj/presentation/travel/travel_like_screen.dart'
    as _i6;
import 'package:flutter_demo_proj/presentation/travel/travel_message_screen.dart'
    as _i7;
import 'package:flutter_demo_proj/presentation/travel/travel_setting_screen.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    TodoDetailProvider.name: (routeData) {
      final args = routeData.argsAs<TodoDetailProviderArgs>(
          orElse: () => const TodoDetailProviderArgs());
      return _i9.AutoRoutePage<_i10.TodoEntity>(
        routeData: routeData,
        child: _i1.TodoDetailProvider(
          key: args.key,
          todoEntity: args.todoEntity,
          title: args.title,
          buttonLabel: args.buttonLabel,
        ),
      );
    },
    TodoListProv.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TodoListProv(),
      );
    },
    TravelBottomNavigationBar.name: (routeData) {
      final args = routeData.argsAs<TravelBottomNavigationBarArgs>(
          orElse: () => const TravelBottomNavigationBarArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.TravelBottomNavigationBar(key: args.key),
      );
    },
    TravelDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TravelDetailRouteArgs>(
          orElse: () => const TravelDetailRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.TravelDetailScreen(key: args.key),
      );
    },
    TravelHomeRoute.name: (routeData) {
      final args = routeData.argsAs<TravelHomeRouteArgs>(
          orElse: () => const TravelHomeRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.TravelHomeScreen(key: args.key),
      );
    },
    TravelLikeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TravelLikeScreen(),
      );
    },
    TravelMessageRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TravelMessageScreen(),
      );
    },
    TravelSettingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TravelSettingScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.TodoDetailProvider]
class TodoDetailProvider extends _i9.PageRouteInfo<TodoDetailProviderArgs> {
  TodoDetailProvider({
    _i11.Key? key,
    _i10.TodoEntity? todoEntity,
    String title = "AddTodo",
    String buttonLabel = "Add",
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TodoDetailProvider.name,
          args: TodoDetailProviderArgs(
            key: key,
            todoEntity: todoEntity,
            title: title,
            buttonLabel: buttonLabel,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoDetailProvider';

  static const _i9.PageInfo<TodoDetailProviderArgs> page =
      _i9.PageInfo<TodoDetailProviderArgs>(name);
}

class TodoDetailProviderArgs {
  const TodoDetailProviderArgs({
    this.key,
    this.todoEntity,
    this.title = "AddTodo",
    this.buttonLabel = "Add",
  });

  final _i11.Key? key;

  final _i10.TodoEntity? todoEntity;

  final String title;

  final String buttonLabel;

  @override
  String toString() {
    return 'TodoDetailProviderArgs{key: $key, todoEntity: $todoEntity, title: $title, buttonLabel: $buttonLabel}';
  }
}

/// generated route for
/// [_i2.TodoListProv]
class TodoListProv extends _i9.PageRouteInfo<void> {
  const TodoListProv({List<_i9.PageRouteInfo>? children})
      : super(
          TodoListProv.name,
          initialChildren: children,
        );

  static const String name = 'TodoListProv';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TravelBottomNavigationBar]
class TravelBottomNavigationBar
    extends _i9.PageRouteInfo<TravelBottomNavigationBarArgs> {
  TravelBottomNavigationBar({
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TravelBottomNavigationBar.name,
          args: TravelBottomNavigationBarArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TravelBottomNavigationBar';

  static const _i9.PageInfo<TravelBottomNavigationBarArgs> page =
      _i9.PageInfo<TravelBottomNavigationBarArgs>(name);
}

class TravelBottomNavigationBarArgs {
  const TravelBottomNavigationBarArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'TravelBottomNavigationBarArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.TravelDetailScreen]
class TravelDetailRoute extends _i9.PageRouteInfo<TravelDetailRouteArgs> {
  TravelDetailRoute({
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TravelDetailRoute.name,
          args: TravelDetailRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TravelDetailRoute';

  static const _i9.PageInfo<TravelDetailRouteArgs> page =
      _i9.PageInfo<TravelDetailRouteArgs>(name);
}

class TravelDetailRouteArgs {
  const TravelDetailRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'TravelDetailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.TravelHomeScreen]
class TravelHomeRoute extends _i9.PageRouteInfo<TravelHomeRouteArgs> {
  TravelHomeRoute({
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TravelHomeRoute.name,
          args: TravelHomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TravelHomeRoute';

  static const _i9.PageInfo<TravelHomeRouteArgs> page =
      _i9.PageInfo<TravelHomeRouteArgs>(name);
}

class TravelHomeRouteArgs {
  const TravelHomeRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'TravelHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.TravelLikeScreen]
class TravelLikeRoute extends _i9.PageRouteInfo<void> {
  const TravelLikeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TravelLikeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TravelLikeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TravelMessageScreen]
class TravelMessageRoute extends _i9.PageRouteInfo<void> {
  const TravelMessageRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TravelMessageRoute.name,
          initialChildren: children,
        );

  static const String name = 'TravelMessageRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TravelSettingScreen]
class TravelSettingRoute extends _i9.PageRouteInfo<void> {
  const TravelSettingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TravelSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TravelSettingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
