class ZipCodeModel {
  final String district;
  final String zipCode;
  final String complement;
  final String areaCode;
  final String gia;
  final String ibgeCode;
  final String city;
  final String street;
  final String siafi;
  final String uf;

  ZipCodeModel({
    required this.district,
    required this.zipCode,
    required this.complement,
    required this.areaCode,
    required this.gia,
    required this.ibgeCode,
    required this.city,
    required this.street,
    required this.siafi,
    required this.uf,
  });

  factory ZipCodeModel.fromJson(Map<String, dynamic> json) {
    return ZipCodeModel(
      district: json['bairro'],
      zipCode: json['cep'],
      complement: json['complemento'],
      areaCode: json['ddd'],
      gia: json['gia'],
      ibgeCode: json['ibge'],
      city: json['localidade'],
      street: json['logradouro'],
      siafi: json['siafi'],
      uf: json['uf'],
    );
  }
}
