import 'package:go_router/go_router.dart';

import '../../features/Home/presentation/view/layout_screen.dart';
import '../../features/on_boarding/presentation/view/on_boarding_screen.dart';
import '../../features/splash/presentation/view/splash_screen.dart';

abstract class AppRouts {
  static const String initialRoute = '/';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String layoutScreen = '/layoutScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: layoutScreen,
        builder: (context, state) => const LayoutScreen(),
      ),
    ],
  );
}
