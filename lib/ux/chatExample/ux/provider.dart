import 'package:contacts_service/contacts_service.dart';
import 'package:examples/ux/chatExample/domain/entities/chat_entitie.dart';
import 'package:examples/ux/chatExample/domain/entities/contac_entitie.dart';
import 'package:examples/ux/chatExample/domain/repository/conatct_application_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/contacs_native_repository_inter.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider extends ChangeNotifier {
  ChatProvider({
    required this.contactRepositoryInterface,
    required this.contactApplicaionRepositoryInterface,
  });
  final ContactNativeRepositoryInterface contactRepositoryInterface;
  final ContactApplicaionRepositoryInterface
      contactApplicaionRepositoryInterface;
  final List<ContactEntitie> contacts = [];
  final List<ContactEntitie> chatContacts = [];
  final List<ChatEntitie> chats = [];

  Future<void> getContacts() async {
    final List<Contact> contactsPhones =
        await contactRepositoryInterface.getContacts();
    String numeroTemp = "";
    for (int i = 0; i < contactsPhones.length; i++) {
      if (contactsPhones[i].phones != null &&
          contactsPhones[i].phones!.isNotEmpty) {
        if (contactsPhones[i].phones![0].value!.length > 7 &&
            contactsPhones[i].phones![0].value != "" &&
            contactsPhones[i].phones![0].value! != null) {
          numeroTemp = convertContact(contactsPhones[i].phones![0].value!);
          if (numeroTemp.length > 8) {
            ContactEntitie contactModel =
                ContactEntitie(contactsPhones[i].displayName!, numeroTemp);
            contacts.add(contactModel);
            numeroTemp = "";
          } else {
            numeroTemp = "";
          }
        }
      }
    }
    for (int i = 0; i < contacts.length; i++) {
      if (contacts[i].number == '' && contacts[i].number == "") {
        contacts.remove(contacts[i]);
      }
    }

    notifyListeners();
  }

  String convertContact(String number) {
    String numberConvert = '';
    int a = 0;
    if (number[0] == '+') {
      a = 2;
    } else {
      for (int i = a; i < number.length; i++) {
        if (number[i] != ' ' &&
            number[i] != '' &&
            number[i] != '+' &&
            number[i] != '-' &&
            number[i] != '(' &&
            number[i] != ')') {
          numberConvert += number[i];
        }
      }
    }
    return numberConvert;
  }

  Future<void> getContactsApplication() async {
    await contactApplicaionRepositoryInterface.getContactsAplication(contacts);
  }
}
