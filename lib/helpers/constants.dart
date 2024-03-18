import 'package:flutter/material.dart';

const List walletIcons = [
  bank,
  wallet1,
  wallet,
];

List<Map<String, String>> appIcons = [
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

List<Map<String, String>> appColors = [
  {
    "key": "F44336",
    "value": "F44336",
  },
  {
    "key": "4CAF50",
    "value": "4CAF50",
  },
  {
    "key": "2196F3",
    "value": "2196F3",
  },
  {
    "key": "FFC107",
    "value": "FFC107",
  },
  {
    "key": "9C27B0",
    "value": "9C27B0",
  },
];

List<Map<String, String>> accountTypes = [
  {
    "key": "Regular",
    "value": "regular",
  },
  {
    "key": "Closed",
    "value": "closed",
  },
];

List<Map<String, String>> categoryTypes = [
  {
    "key": "Expenses",
    "value": "regular",
  },
  {
    "key": "Others",
    "value": "closed",
  },
];

List<Map<String, String>> appCurrencies = [
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

// URLS
// Links and Texts
const String apiUrl =
    "https://my-json-server.typicode.com/woelabs/money_manager_api";

// Colors
const Color primary = Color(0XFF000000);
const Color secondary = Color(0xFF07C065);
const Color black = Color(0XFF24292E);
const Color otherPrimaryColor = Color(0xFF1C38FF);
const Color danger = Color(0xFFF40A23);
const Color warning = Color(0xFFF4AA0A);
const Color purple = Color.fromARGB(255, 136, 13, 213);
const Color success = Color(0XFF28a745);
const Color textColor = Color(0xFF2B3445);
const Color greyColor = Color(0xFF8D8D8E);
const double defaultPadding = 14.0;
Color greyTextColor = const Color.fromARGB(255, 53, 52, 52).withOpacity(0.7);
const Color secondaryColor80LightTheme = Color(0xFFF8F8F8);
const Color secondaryColor60LightTheme = Color(0xFFF8F8F8);
const Color secondaryColor40LightTheme = Color(0xFFF8F8F8);
const Color secondaryColor10LightTheme = Color(0xFFF8F8F8);
const Color secondaryColor5LightTheme = Color(0xFFF8F8F8);

String exitwarning = "Appuyer encore une fois pour quitter";

/// Navigation buttom icons
const String bdashboard = "assets/images/b-home.svg";
const String bsetting = "assets/images/b-setting.svg";
const String bchart = "assets/images/b-chart.svg";
const String bcoins = "assets/images/b-coins.svg";

// Other icons
const String visibility = "assets/images/visibility.svg";
const String stats = "assets/images/stats.svg";
const String bank = "assets/images/bank.svg";
const String wallet = "assets/images/wallet.svg";
const String wallet1 = "assets/images/wallet1.svg";
const String user = "assets/images/user.svg";
const String hand = "assets/images/hand.svg";
