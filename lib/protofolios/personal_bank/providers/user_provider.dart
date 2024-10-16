import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/auth.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/holder.dart';
import 'package:my_portfolio/protofolios/personal_bank/models/user.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class UserProvider extends ChangeNotifier with Holder<User> {
  final Auth? _auth;
  UserProvider({Auth? auth}) : _auth = auth {
    holdData = User(
      avatar: const AssetImage('assets/images/cat.jpg'),
      email: 'cat@gmail.com',
      birthday: Jalali(1380, 7, 12).toDateTime(),
      city: "تهران",
      country: "ایران",
      name: "گوربه",
      password: "123456789",
      permanentAddress: "همون آدرس فعلی، با تشکر",
      postalCode: 12345,
      presentAddress: "خیابون ونک، جنب پاساژ بهار، پلاک 16",
      username: "catiosha",
    );
  }

  @override
  updateHoldData(User newData) {
    // update on server with help of _auth
    super.updateHoldData(newData);
    notifyListeners();
  }
}
