import 'package:contacts_service/contacts_service.dart';
import 'package:examples/ux/chatExample/domain/repository/contacs_native_repository_inter.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsNativeRepositoryImplementation
    extends ContactNativeRepositoryInterface {
  @override
  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = await ContactsService.getContacts();
    return contacts;
  }

  @override
  Future<bool> askPermissions() async {
    PermissionStatus permissionStatus = await getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<PermissionStatus> getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }
}
