class CertificateModel {
  final int id;
  final String title;
  final String name;

  CertificateModel({
    required this.id,
    required this.title,
    required this.name,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id'],
      title: json['title'],
      name: json['name'],
    );
  }
}
