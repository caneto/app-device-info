// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $feedRoute,
      $discoverRoute,
    ];

RouteBase get $feedRoute => GoRouteData.$route(
      path: '/feed',
      factory: $FeedRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'feed-details/:id',
          factory: $FeedDetailsRouteExtension._fromState,
        ),
      ],
    );

extension $FeedRouteExtension on FeedRoute {
  static FeedRoute _fromState(GoRouterState state) => const FeedRoute();

  String get location => GoRouteData.$location(
        '/feed',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $FeedDetailsRouteExtension on FeedDetailsRoute {
  static FeedDetailsRoute _fromState(GoRouterState state) => FeedDetailsRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/feed/feed-details/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $discoverRoute => GoRouteData.$route(
      path: '/discover',
      factory: $DiscoverRouteExtension._fromState,
    );

extension $DiscoverRouteExtension on DiscoverRoute {
  static DiscoverRoute _fromState(GoRouterState state) => DiscoverRoute();

  String get location => GoRouteData.$location(
        '/discover',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
