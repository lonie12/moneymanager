class Wallet {
  Wallet({
    required this.id,
    required this.value,
    required this.name,
    required this.balance,
    required this.currency,
    required this.description,
  });

  int id;
  String value;
  String name;
  double balance;
  String currency;
  String description;

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json["id"],
      value: json["value"],
      name: json["name"],
      balance: double.parse(json["balance"].toString()),
      currency: json["currency"].toLowerCase(),
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "name": name,
        "balance": balance,
        "currency": currency,
        "description": description,
      };
}
