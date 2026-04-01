import 'package:go_router/go_router.dart';
import 'package:selfcare_app/pages/home_page.dart';
import 'package:selfcare_app/pages/category_product_page.dart';

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
        return CategoryProductPage(careId: int.parse(id));
      }
    )
  ]
);