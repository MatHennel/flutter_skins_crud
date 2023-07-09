class User {
  final String? id;
  final String name;
  final String preco;
  final String arma;
  final String desgaste;
  final String avatarUrl;

  const User({
    this.id,
    required this.name,
    required this.preco,
    required this.arma,
    required this.desgaste,
    required this.avatarUrl,
  });
}
