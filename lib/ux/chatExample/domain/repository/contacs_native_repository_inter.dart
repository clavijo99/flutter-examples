import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class ContactNativeRepositoryInterface {
  Future<bool> askPermissions();
  Future<PermissionStatus> getContactPermission();
  Future<List<Contact>> getContacts();
}
