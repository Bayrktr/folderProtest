import 'package:auto_route/auto_route.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';

extension NavigationExtention on StackRouter {
  String? get previousRoutePath {
    if (stack.length > 1) {
      final previousRoute = stack[stack.length - 2];

      return previousRoute.routeData.name;
    } else {
      print('sayfa yok');
      return null;
    }
  }
}
