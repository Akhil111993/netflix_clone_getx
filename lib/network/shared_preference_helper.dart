// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SharedPreferenceHelper {
//   late FlutterSecureStorage _sharedPreference;
//   var _accessToken = "";
//   var _mobile = "";
//   var _name = "";
//   var _email = "";
//   SharedPreferenceHelper._internal() {
//     _sharedPreference = FlutterSecureStorage();
//   }
//   factory SharedPreferenceHelper() {
//     return SharedPreferenceHelper._internal();
//   }
//   Future<void> saveUser(var data, var mobile) async {
//     await _sharedPreference.write(
//         key: "access_token", value: data["access_token"]);
//     _sharedPreference.write(key: "refresh_token", value: data["refresh_token"]);
//     var expiresIn =
//         DateTime.now().millisecondsSinceEpoch + data["expires_in"] * 1000;
//     _sharedPreference.write(key: "expires_in", value: expiresIn.toString());
//     _sharedPreference.write(key: "is_logged_in", value: "true");
//     _sharedPreference.write(key: "mobile_no", value: mobile["mobile_no"]);
//   }

//   Future<void> updateUser(var name, var email) async {
//     await _sharedPreference.write(key: "name", value: name);
//     await _sharedPreference.write(key: "email", value: email);
//   }

//   Future<bool> checkLogin() async {
//     // clear();
//     if (await _sharedPreference.containsKey(key: "is_logged_in")) {
//       var expiry = await _sharedPreference.read(key: "expires_in");
//       if (DateTime.now().millisecondsSinceEpoch < double.parse(expiry!)) {
//         _accessToken = (await _sharedPreference.read(key: "access_token"))!;
//         print("ACCESS_TOKEN==$_accessToken");
//         _mobile = (await _sharedPreference.read(key: "mobile_no"))!;
//         print("MOBILE==$_mobile");
//         _name = (await _sharedPreference.read(key: "name")) ?? "";
//         _email = (await _sharedPreference.read(key: "email")) ?? "";
//         print("MOBILE==$_email");
//         return true;
//       }
//       return false;
//     } else {
//       return false;
//     }
//   }

//   void clear() {
//     _sharedPreference.deleteAll();
//   }

//   String get accessToken => _accessToken;
//   String get mobile => _mobile;
//   String get name => _name;
//   String get email => _email;

//   removeAll() async {
//     await _sharedPreference.deleteAll();
//   }
// }
