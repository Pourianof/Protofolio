import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/holder.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/preference.dart';

class PreferenceProvider extends ChangeNotifier with Holder<Preference> {
  PreferenceProvider._(Preference prefs) {
    holdData = prefs;
  }

  factory PreferenceProvider.initial(Preference prefs) {
    return PreferenceProvider._(prefs);
  }
  @override
  updateHoldData(Preference newData) {
    // TODO: implement updateUserData
    super.updateHoldData(newData);
    notifyListeners();
  }
}
