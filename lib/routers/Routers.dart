import 'package:go_router/go_router.dart';
import 'package:salmon/screens/LoginScreen.dart';
import 'package:salmon/widgets/BottomNavBarWidgets.dart';

class Routers {
  static GoRouter route = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "home",
        builder: ((context, state) {
          return const BottomNavBarWidgets();
        }),
      ),
      GoRoute(
        path: "/login",
        name: "login",
        builder: ((context, state) {
          return LoginScreen();
        }),
      )
    ],
    initialLocation: "/login",
    debugLogDiagnostics: true,
  );
}
