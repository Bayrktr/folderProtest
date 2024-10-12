import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerManager {

  static Future<bool> isGranted(Permission permissionType) async {
    final bool result = await permissionType.request().isGranted;

    return result;
  }
}
