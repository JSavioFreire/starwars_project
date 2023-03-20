class HttpModel {
  final String name;
  final String birth;
  final String gender;

  const HttpModel({
    required this.name,
    required this.birth,
    required this.gender,
  });

  factory HttpModel.fromJson(Map<String, dynamic> json) {
    return HttpModel(
      name: json['name'],
      birth: json['birth_year'],
      gender: json['gender'],
    );
  }
}
