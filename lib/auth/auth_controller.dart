import 'package:get_storage/get_storage.dart';
import 'package:hack_niche/firebase_controller.dart';
import 'package:http/http.dart';

class AuthController {
  FirebaseController _firebaseController = FirebaseController();
  Future<String> login(
    String email,
    String password,
  ) async {
    final res = Response("{Hi:Hello World}", 200);
    if (res.statusCode != 200) {
      return "incorrect_user_details";
    }
    init(res);
    return "Success";
  }

  void init(Response res) async {
    try {
      final box = GetStorage();
      box.write('token', res.body);
      box.write('id', res.body);
    } catch (e) {
      print(e);
    }

    String? fcmToken = await _firebaseController.fcmToken;
    if (fcmToken == null) return;

    _firebaseController.subscribeToTopic("users");
  }
}
