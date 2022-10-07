import 'package:examples/ux/chatExample/domain/entities/contac_entitie.dart';

abstract class ContactApplicaionRepositoryInterface {
  Future<void> getContactsAplication(List<ContactEntitie> contacts);
}
