// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:estimate_flutter/UI/AddressForm.dart' as _i1;
import 'package:estimate_flutter/UI/EstimateDetails.dart' as _i3;
import 'package:estimate_flutter/UI/EstimateForm.dart' as _i2;
import 'package:estimate_flutter/UI/MainPage.dart' as _i4;
import 'package:estimate_flutter/UI/Preview.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AddressformRoute.name: (routeData) {
      final args = routeData.argsAs<AddressformRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddressformScreen(
          args.heading,
          key: args.key,
        ),
      );
    },
    EstimateFormRoute.name: (routeData) {
      final args = routeData.argsAs<EstimateFormRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EstimateFormScreen(
          args.heading,
          key: args.key,
        ),
      );
    },
    EstimatedetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EstimatedetailsRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EstimatedetailsScreen(
          args.heading,
          key: args.key,
        ),
      );
    },
    MainPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPageScreen(),
      );
    },
    PreviewRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PreviewScreen(
          args.heading,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddressformScreen]
class AddressformRoute extends _i6.PageRouteInfo<AddressformRouteArgs> {
  AddressformRoute({
    required String heading,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AddressformRoute.name,
          args: AddressformRouteArgs(
            heading: heading,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressformRoute';

  static const _i6.PageInfo<AddressformRouteArgs> page =
      _i6.PageInfo<AddressformRouteArgs>(name);
}

class AddressformRouteArgs {
  const AddressformRouteArgs({
    required this.heading,
    this.key,
  });

  final String heading;

  final _i7.Key? key;

  @override
  String toString() {
    return 'AddressformRouteArgs{heading: $heading, key: $key}';
  }
}

/// generated route for
/// [_i2.EstimateFormScreen]
class EstimateFormRoute extends _i6.PageRouteInfo<EstimateFormRouteArgs> {
  EstimateFormRoute({
    required String heading,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          EstimateFormRoute.name,
          args: EstimateFormRouteArgs(
            heading: heading,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EstimateFormRoute';

  static const _i6.PageInfo<EstimateFormRouteArgs> page =
      _i6.PageInfo<EstimateFormRouteArgs>(name);
}

class EstimateFormRouteArgs {
  const EstimateFormRouteArgs({
    required this.heading,
    this.key,
  });

  final String heading;

  final _i7.Key? key;

  @override
  String toString() {
    return 'EstimateFormRouteArgs{heading: $heading, key: $key}';
  }
}

/// generated route for
/// [_i3.EstimatedetailsScreen]
class EstimatedetailsRoute extends _i6.PageRouteInfo<EstimatedetailsRouteArgs> {
  EstimatedetailsRoute({
    required String heading,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          EstimatedetailsRoute.name,
          args: EstimatedetailsRouteArgs(
            heading: heading,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EstimatedetailsRoute';

  static const _i6.PageInfo<EstimatedetailsRouteArgs> page =
      _i6.PageInfo<EstimatedetailsRouteArgs>(name);
}

class EstimatedetailsRouteArgs {
  const EstimatedetailsRouteArgs({
    required this.heading,
    this.key,
  });

  final String heading;

  final _i7.Key? key;

  @override
  String toString() {
    return 'EstimatedetailsRouteArgs{heading: $heading, key: $key}';
  }
}

/// generated route for
/// [_i4.MainPageScreen]
class MainPageRoute extends _i6.PageRouteInfo<void> {
  const MainPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PreviewScreen]
class PreviewRoute extends _i6.PageRouteInfo<PreviewRouteArgs> {
  PreviewRoute({
    required String heading,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PreviewRoute.name,
          args: PreviewRouteArgs(
            heading: heading,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const _i6.PageInfo<PreviewRouteArgs> page =
      _i6.PageInfo<PreviewRouteArgs>(name);
}

class PreviewRouteArgs {
  const PreviewRouteArgs({
    required this.heading,
    this.key,
  });

  final String heading;

  final _i7.Key? key;

  @override
  String toString() {
    return 'PreviewRouteArgs{heading: $heading, key: $key}';
  }
}
