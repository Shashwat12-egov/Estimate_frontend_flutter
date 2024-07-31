import 'package:auto_route/auto_route.dart';
import 'package:estimate_flutter/Utils/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  final List<AutoRoute> routes = [
    AutoRoute(page: MainPageRoute.page, initial: true),
    AutoRoute(page: AddressformRoute.page),
    AutoRoute(page: EstimatedetailsRoute.page),
    AutoRoute(page: PreviewRoute.page),
    AutoRoute(page: EstimateFormRoute.page)
  ];
}