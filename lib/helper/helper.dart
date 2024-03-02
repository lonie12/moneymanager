import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  static bool kDebugMode = true;

  static Color darkColor = const Color(0xFF212121);

  static Color kPrimaryColor = const Color(0xFF000000);
  static List<String> daysFr = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];

  // static Color primary = Color(0XFF1929FF);
  static Color primary = const Color(0XFF000000);
  static Color secondary = const Color(0xFF07C065);
  static Color black = const Color(0XFF24292E);
  static Color otherPrimaryColor = const Color(0xFF1C38FF);
  static Color danger = const Color(0xFFF40A23);
  static Color warning = const Color(0xFFF4AA0A);
  static Color purple = const Color.fromARGB(255, 136, 13, 213);
  static Color success = const Color(0XFF28a745);
  static Color textColor = const Color(0xFF2B3445);
  static Color greyColor = const Color(0xFF8D8D8E);
  static const double defaultPadding = 14.0;
  static Color get greyTextColor =>
      const Color.fromARGB(255, 53, 52, 52).withOpacity(0.7);
  static const Color secondaryColor80LightTheme = Color(0xFFF8F8F8);
  static const Color secondaryColor60LightTheme = Color(0xFFF8F8F8);
  static const Color secondaryColor40LightTheme = Color(0xFFF8F8F8);
  static const Color secondaryColor10LightTheme = Color(0xFFF8F8F8);
  static const Color secondaryColor5LightTheme = Color(0xFFF8F8F8);

  // Links and Texts
  static String apiUrl =
      "https://my-json-server.typicode.com/woelabs/money_manager_api";
  static String imagesUrl = "assets/images/";
  static String exitwarning = "Appuyer encore une fois pour quitter";
  static const String lorem =
      "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Excepturi minus reiciendis cum impedit error eius ullam consequuntur dolore sit necessitatibus. Et quis repellat ex reiciendis sapiente. Accusantium neque maxime odio.";

  /// Navigation buttom icons
  static String bdashboard = "${imagesUrl}b-home.svg";
  static String bsetting = "${imagesUrl}b-setting.svg";
  static String bchart = "${imagesUrl}b-chart.svg";
  static String bcoins = "${imagesUrl}b-coins.svg";

  // Other icons
  static String visibility = "${imagesUrl}visibility.svg";
  static String stats = "${imagesUrl}stats.svg";
  static String bank = "${imagesUrl}bank.svg";
  static String wallet = "${imagesUrl}wallet.svg";
  static String wallet1 = "${imagesUrl}wallet1.svg";
  static String user = "${imagesUrl}user.svg";
  static String hand = "${imagesUrl}hand.svg";

  // Images
  // static String logo = "${imagesUrl}applogo.png";

  static parseDateToMMDDYYYY(DateTime? date) {
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    if (date is DateTime) {
      return formatter.format(date);
    } else {
      return date;
    }
  }

  static List walletIcons = [bank, wallet1, wallet];

  static List<Map<String, String>> appIcons = [
    {
      "key": bank,
      "value": "bank",
    },
    {
      "key": wallet,
      "value": "Wallet",
    },
    {
      "key": wallet1,
      "value": "wallet1",
    },
  ];

  static List<Map<String, String>> appColors = [
    {
      "key": "F44336",
      "value": "red",
    },
    {
      "key": "4CAF50",
      "value": "green",
    },
    {
      "key": "2196F3",
      "value": "blue",
    },
    {
      "key": "FFC107",
      "value": "yellow",
    },
    {
      "key": "9C27B0",
      "value": "violet",
    },
  ];

  static List<Map<String, String>> accountTypes = [
    {
      "key": "Regular",
      "value": "regular",
    },
    {
      "key": "Closed",
      "value": "closed",
    },
  ];

  static List<Map<String, String>> appCurrencies = [
    {
      "key": "XOF",
      "value": "xof",
    },
    {
      "key": "USD",
      "value": "usd",
    },
    {
      "key": "EUR",
      "value": "eur",
    },
  ];

  static Codec<String, String> stringToBase64 = utf8.fuse(base64);
}
