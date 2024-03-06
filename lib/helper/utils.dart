import 'dart:io';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/helper/constants.dart';

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final int? y;
}

// Dev
class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// Find icon with key
String appIconWithValue(String value) {
  return (appIcons.firstWhere((e) => e["value"] == value))["key"]!;
}

// Find currency with key
String appCurrencyWithValue(String value) {
  return (appCurrencies.firstWhere((e) => e["value"] == value))["key"]!;
}

// Find color with key
String? appColorWithValue(String value) {
  var color = (appColors.firstWhere((e) => e["value"] == value))["key"];
  return color != null && color.isNotEmpty ? color : null;
}

// Balance format 
utilsThousandSeparator(value, currency) {
  return NumberFormat.currency(
    locale: "fr-FR",
    name: currency,
    decimalDigits: 0,
  ).format(value);
}

// inputs Validation 
bool stringFormValidation(List<String> data) {
  var result = true;
  for (var i = 0; i < data.length; i++) {
    if (data[i].isEmpty) {
      result = false;
      break;
    }
  }
  return result;
}

// Inputs validation 
bool doubleFormValidation(List<double> data) {
  var result = true;
  for (var i = 0; i < data.length; i++) {
    if (data[i].isNaN) {
      result = false;
      break;
    }
  }
  return result;
}

// 
bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }
  return double.tryParse(s) != null;
}

// Date format 
String dateFormat(DateTime date, String type, {location = "fr"}) {
  var result = "";
  if (type == "mois") {
    result = DateFormat.yMMM("${location}_${location.toUpperCase()}").format(
      date,
    );
  }
  if (type == "annee") {
    result = DateFormat.y("${location}_${location.toUpperCase()}").format(
      date,
    );
  }

  if (type == "complet") {
    result = DateFormat.yMMMEd("${location}_${location.toUpperCase()}").format(
      date,
    );
  }

  return result.substring(0, 1).toUpperCase() + result.substring(1);
}

// App setting screen menu
var settingMenu = [
  {
    'icon': CarbonIcons.person,
    'title': 'Account',
    'description': "Your personal information",
    'onTap': (context) {
      Fluttertoast.showToast(msg: "Default french");
    },
    'featured': true,
    'new': false,
  },
  {
    'icon': CarbonIcons.language,
    'title': 'Language',
    'description': "Change app language",
    'onTap': (context) {
      Fluttertoast.showToast(msg: "Default french");
    },
    'featured': true,
    'new': true,
  },
  {
    'icon': CarbonIcons.information,
    'title': 'About',
    'description': "About app",
    'onTap': (context) => {},
    'featured': true,
    'new': false,
  },
  {
    'icon': CarbonIcons.logout,
    'title': 'Disconnect',
    'description': "Close session",
    'onTap': (BuildContext context) {},
    'featured': true,
    'new': false,
  },
];
