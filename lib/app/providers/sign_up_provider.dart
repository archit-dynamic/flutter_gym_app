import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gym_app/app/models/user_data_model.dart';
import 'package:flutter_gym_app/app/utils/db_references.dart';
import 'package:flutter_gym_app/app/utils/enums.dart';
import 'package:uuid/uuid.dart';

class SignUpProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  bool showErrorMessage = false;
  AuthenticationState authenticationState = AuthenticationState.unauthorized;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<User?> signUp(
      {required String email,
      required String password,
      String? firstName,
      String? lastName,
      String? birthDate,
      String? gender}) async {
    try {
      authenticationState = AuthenticationState.authenticating;
      notifyListeners();
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        debugPrint("Successfully Signed In");
        authenticationState = AuthenticationState.authorized;
        notifyListeners();
        user = userCredential.user;
        setUserData(
            email: email,
            lastName: lastName,
            gender: gender,
            firstName: firstName,
            birthDate: birthDate);
        return user;
      } else {
        debugPrint("Error Signing in........");
        showErrorMessage = true;
        authenticationState = AuthenticationState.unauthorized;
        notifyListeners();
        return null;
      }
    } on Exception catch (e) {
      debugPrint("Error Signing in........");
      debugPrint("Error: $e");
      showErrorMessage = true;
      authenticationState = AuthenticationState.unauthorized;
      notifyListeners();
      return null;
    }
  }

  setUserData(
      {required String email,
      String? firstName,
      String? lastName,
      String? birthDate,
      String? gender}) async {
    try {
      final String userUuid = const Uuid().v4();
      final UserData userData = UserData(
        id: userUuid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        gender: gender,
      );

      await db
          .collection(DBReferences.userData)
          .doc(userUuid)
          .set(userData.toFirestore())
          .then((value) {
        debugPrint("Successfully saved user data .......");
        getAllUsersData();
      });
    } on Exception catch (e) {
      debugPrint("Error setting user data .......");
      debugPrint("Error: $e");
    }
  }

  getAllUsersData() async {
    await db.collection(DBReferences.userData).get().then((value) {
      value.docs.forEach((element) {
        debugPrint(UserData.fromFirestore(element).toString());
      });
    });
  }
}
