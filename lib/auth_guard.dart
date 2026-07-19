import 'package:auto_route/auto_route.dart';
import 'package:router_practice/routes_config.dart';

// Importa donde tengas tu función checkUserSession

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // 1. Evaluamos la sesión del usuario
    if (checkUserSession()) {
      // Si es true, le damos luz verde para continuar a la pantalla que quería ir
      resolver.next(true); 
    } else {
      // Si es false, frenamos la navegación y lo redirigimos al Login
      resolver.redirectUntil(const LoginRoute());
    }
  }
}