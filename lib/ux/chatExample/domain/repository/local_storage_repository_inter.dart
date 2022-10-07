abstract class LocalStrorageRepositoryInterface {
  Future<void> setToken(String token);
  Future<String?> getToken();
  Future<void> setPhone(String phone);
  Future<String?> getPhone();
  Future<void> setName(String name);
  Future<String?> getName();
  Future<void> setImage(String image);
  Future<String?> getImage();
  Future<void> deleteUser();
}
