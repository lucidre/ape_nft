// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../presentation/layout/layout.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SiteRoute.name: (routeData) {
      final args =
          routeData.argsAs<SiteRouteArgs>(orElse: () => const SiteRouteArgs());
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SitePage(key: args.key),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          SiteRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [_i1.SitePage]
class SiteRoute extends _i2.PageRouteInfo<SiteRouteArgs> {
  SiteRoute({_i3.Key? key})
      : super(
          SiteRoute.name,
          path: '/',
          args: SiteRouteArgs(key: key),
        );

  static const String name = 'SiteRoute';
}

class SiteRouteArgs {
  const SiteRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'SiteRouteArgs{key: $key}';
  }
}
