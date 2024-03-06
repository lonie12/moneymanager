class Expense {
  Expense({
    required this.id,
    required this.date,
    required this.category,
    required this.wallet,
    required this.amount,
    required this.description,
  });

  int id;
  String date;
  int category;
  int wallet;
  int amount;
  String description;

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json["id"],
      date: json["date"].toString(),
      category: json["category"],
      wallet: json["wallet"],
      amount: json["amount"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "category": category,
        "wallet": wallet,
        "amount": amount,
        "description": description,
      };
}
