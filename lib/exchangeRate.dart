// To parse this JSON data, do
//
//     final exchangeRate = exchangeRateFromJson(jsonString);

import 'dart:convert';


ExchangeRate exchangeRateFromJson(String str) => ExchangeRate.fromJson(json.decode(str));

String exchangeRateToJson(ExchangeRate data) => json.encode(data.toJson());

class ExchangeRate {
  ExchangeRate({
    required this.baseCode,
    required this.conversionRates,

  });

  String baseCode;
  Map<String, double> conversionRates;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
    baseCode: json["base_code"],
    conversionRates: Map.from(json["conversion_rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "base_code": baseCode,
    "conversion_rates": Map.from(conversionRates).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
