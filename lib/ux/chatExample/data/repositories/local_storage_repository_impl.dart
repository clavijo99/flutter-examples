import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefToken = 'Token';
const _prefName = 'UserName';
const _prefPhone = 'Phone';
const _prefImage = 'Image';

class LocalStorageRepositoryImplementation
    extends LocalStrorageRepositoryInterface {
  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefToken);
  }

  @override
  Future<void> setToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefToken, token);
  }

  @override
  Future<void> deleteUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  @override
  Future<void> setImage(String image) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefImage, image);
  }

  @override
  Future<void> setName(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefName, name);
  }

  @override
  Future<void> setPhone(String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefPhone, phone);
  }

  @override
  Future<String?> getImage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefImage);
  }

  @override
  Future<String?> getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefName);
  }

  @override
  Future<String?> getPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefPhone);
  }
}
