class Category {
  final int id;
  final String name;

  static const Category income = Category._(1, "Ingreso");
  static const Category food = Category._(2, "Comida");
  static const Category entertainment = Category._(3, "Entretenimiento");
  static const Category rent = Category._(4, "Alquiler");
  static const Category bills = Category._(5, "Servicios");
  static const Category others = Category._(6, "Otros");

  static const List<Category> all = [
    income,
    food,
    entertainment,
    rent,
    bills,
    others
  ];

  const Category._(this.id, this.name);
}
