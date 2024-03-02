import 'package:intl/intl.dart';
import 'package:moneymanager/helper/helper.dart';

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final int? y;
}

String appIconWithValue(String value) {
  return (Helper.appIcons.firstWhere((e) => e["value"] == value))["key"]!;
}

String appCurrencyWithValue(String value) {
  return (Helper.appCurrencies.firstWhere((e) => e["value"] == value))["key"]!;
}

utilsThousandSeparator(value, currency) {
  return NumberFormat.compactCurrency(
    locale: "fr-FR",
    name: currency,
    decimalDigits: 0,
  ).format(value);
}

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
