# Flutter go_router with nested navigation

A simple Flutter project with sample code about how to work with go_router, nested navigation and typed routes.

## Getting Started

To get started, add go_router to your pubspec.yaml. In this article we'll be using ^7.1.1.

We'll be using in this project:
- go_router: ^7.1.1
- go_router_builder: ^2.0.2
- build_runner: ^2.4.4
- build_verify: ^3.1.0


```dart
import 'package:go_router/go_router.dart';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: 'page2',
      path: '/page2',
      builder: (context, state) => Page2Screen(),
    ),
  ],
);
```

