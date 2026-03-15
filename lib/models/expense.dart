class Expense {
  int? id;
  String name;
  int money;
  DateTime date;

  Expense({
    this.id,
    required this.name,
    required this.money,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'money': money,
      'date': date.toIso8601String(),
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      name: map['name'],
      money: map['money'],
      date: DateTime.parse(map['date']),
    );
  }
}
