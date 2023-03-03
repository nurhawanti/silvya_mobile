class User {
  User({
    required this.id,
    required this.nama,
    required this.nim,
    required this.username,
    required this.password,
    required this.email,
    required this.tlp,
    required this.foto,
    required this.prodi,
  });

  int id;
  String nama;
  String nim;
  String username;
  String password;
  String email;
  String tlp;
  String foto;
  String prodi;

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    nama: json["nama"],
    nim: json["nim"],
    username: json["username"],
    password: json["PASSWORD"],
    email: json["email"],
    tlp: json["tlp"],
    foto: json["foto"],
    prodi: json["prodi"],
  );
}