// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CalendarRoute.name: (routeData) {
      final args = routeData.argsAs<CalendarRouteArgs>(
          orElse: () => const CalendarRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CalendarScreen(key: args.key),
      );
    },
    CreateMeetingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateMeetingScreen(),
      );
    },
  };
}

/// generated route for
/// [CalendarScreen]
class CalendarRoute extends PageRouteInfo<CalendarRouteArgs> {
  CalendarRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CalendarRoute.name,
          args: CalendarRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const PageInfo<CalendarRouteArgs> page =
      PageInfo<CalendarRouteArgs>(name);
}

class CalendarRouteArgs {
  const CalendarRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CalendarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CreateMeetingScreen]
class CreateMeetingRoute extends PageRouteInfo<void> {
  const CreateMeetingRoute({List<PageRouteInfo>? children})
      : super(
          CreateMeetingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateMeetingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
