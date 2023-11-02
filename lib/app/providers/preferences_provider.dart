import 'package:flutter/cupertino.dart';
import 'package:flutter_gym_app/app/utils/enums.dart';

class PreferencesProvider extends ChangeNotifier {
  Preference preference = Preference.metric;

  void setPreference(Preference pref) {
    preference = pref;
    notifyListeners();
  }

  Preference get currentPreference => preference;
}
