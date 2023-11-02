import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gym_app/app/utils/enums.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  bool showErrorMessage = false;
  AuthenticationState authenticationState = AuthenticationState.unauthorized;

  void login(String email, String password) async {
    try {
      authenticationState = AuthenticationState.authenticating;
      notifyListeners();
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        debugPrint("Successfully Logged In");
        authenticationState = AuthenticationState.authorized;
        notifyListeners();
        user = userCredential.user;
      } else {
        debugPrint("Error logging in........");
        showErrorMessage = true;
        authenticationState = AuthenticationState.unauthorized;
        notifyListeners();
      }
    } on Exception catch (e) {
      debugPrint("Error logging in........");
      debugPrint("Error: $e");
      showErrorMessage = true;
      authenticationState = AuthenticationState.unauthorized;
      notifyListeners();
    }
  }
}
