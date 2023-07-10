class Skin {
  final String? id;
  final String name;
  final String preco;
  final String arma;
  final String desgaste;
  final String avatarUrl;

  const Skin({
    this.id,
    required this.name,
    required this.preco,
    required this.arma,
    required this.desgaste,
    required this.avatarUrl,
  });

  Skin copyWith({String? id}) {
    return Skin(
      id: id ?? this.id,
      name: name,
      preco: preco,
      arma: arma,
      desgaste: desgaste,
      avatarUrl: avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'preco': preco,
      'arma': arma,
      'desgaste': desgaste,
      'avatarUrl': avatarUrl,
    };
  }

  factory Skin.fromMap(Map<String, dynamic> map) {
    return Skin(
      id: map['id'],
      name: map['name'],
      preco: map['preco'],
      arma: map['arma'],
      desgaste: map['desgaste'],
      avatarUrl: map['avatarUrl'],
    );
  }
}
