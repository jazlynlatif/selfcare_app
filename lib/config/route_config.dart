import 'package:go_router/go_router.dart';
import 'package:selfcare_app/screens/home_page_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase> [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      }
    )
  ]
);