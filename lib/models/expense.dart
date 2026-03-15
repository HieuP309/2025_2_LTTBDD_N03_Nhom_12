class Expense {
  int? id;
  String name;
  int money;

  Expense({
    this.id,
    required this.name,
    required this.money,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'money': money};
  }
}
