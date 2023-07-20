enum Item {
  magical(7),
  sharp(5),
  heavy(3);

  const Item(this.damage);
  final int damage;

  int bonus() => damage;
}
