import 'package:go_router/go_router.dart';
import 'package:selfcare_app/screens/home_page_screen.dart';
import 'package:selfcare_app/screens/specific_care_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase> [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      }
    ),
    GoRoute(
      path: '/category/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return SpecificCarePage(care: int.parse(id));
      }
    )
  ]
);