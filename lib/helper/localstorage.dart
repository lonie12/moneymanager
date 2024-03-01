import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences localstorage;
  static init() async {
    localstorage = await SharedPreferences.getInstance();
  }

  // static User? user;

  // Token d'identification (api)
  static String get token => localstorage.getString("userToken") ?? "";
  static set token(String token) => localstorage.setString("userToken", token);

  static bool get isdark => localstorage.getBool("isdark") ?? false;

  // Verification de la connexion à l'api
  static bool get logged => localstorage.getBool("isLogged") ?? false;
  static set logged(bool value) => localstorage.setBool("isLogged", value);

  // Enregistrer localement les informations d'un utilisateur
  // static saveUserInformations(User user) async {
  //   token = user.token;
  //   dtoken = user.devicetoken ?? "";
  //   var encoded = json.encode(user);
  //   await localstorage.setString("userData", encoded);
  //   await LocalStorage.init();
  //   return user = user;
  // }

  // static getUserLocalInformations() {
  //   var data = localstorage.getString("userData") ?? "[]";
  //   var decode = json.decode(data);
  //   return user = User.fromJson(decode);
  // }

  // userIsLogged
  static userIsLogged() async {
    logged = true;
    return await LocalStorage.init();
  }

  // static Future<void> logout() async {
  //   // profileProvider.loading.value = true;
  //   // await AuthApiCall.logout();
  //   sponsorCode = "";
  //   isSponsor = false;
  //   token = "";
  //   dtoken = "";
  //   // bet = 0;
  //   balance = 0;
  //   logged = false;
  //   localstorage.remove("userData");
  //   await localstorage.clear();
  //   Get.offAll(AuthIndex());
  //   await LocalStorage.init();
  //   // profileProvider.loading.value = false;
  // }
}
