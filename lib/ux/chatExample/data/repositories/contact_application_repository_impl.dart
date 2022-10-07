import 'package:examples/ux/chatExample/data/api.dart';
import 'package:examples/ux/chatExample/domain/entities/contac_entitie.dart';
import 'package:examples/ux/chatExample/domain/repository/conatct_application_repository_inter.dart';

class ContactApplicationRepositoryImplementation
    extends ContactApplicaionRepositoryInterface {
  ApiImplementation apiImplementation = ApiImplementation();

  @override
  Future<void> getContactsAplication(List<ContactEntitie> contacts) async {
    await apiImplementation.getContactApplication(contacts);
  }
}
