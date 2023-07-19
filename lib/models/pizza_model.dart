class Pizza {
  String name;
  List toppings;
  bool isBabySize;

  Pizza({
    required this.name,
    required this.toppings,
    this.isBabySize = false,
  });
}
