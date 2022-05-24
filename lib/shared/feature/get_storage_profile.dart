import 'package:get_storage/get_storage.dart';

class GetStorageProfile {
  var box = GetStorage();

  storeProfileInfo(
      {required String name,
      required String email,
      required String phoneNumber,
      required var id}) {
    box.write('name', name);
    box.write('email', email);
    box.write('phoneNumber', phoneNumber);
    box.write('id', id);
  }

  storeToken({required String token}) {
    box.write('token', token);
  }

  storeName({required String name}) {
    box.write('name', name);
  }

  storeEmail({required String email}) {
    box.write('email', email);
  }

  storePhoneNumber({required String phoneNumber}) {
    box.write('phoneNumber', phoneNumber);
  }

  storeAddress({required String address}) {
    box.write('address', address);
  }

  String getToken() {
    String temp = box.read('token');
    return temp;
  }
}
