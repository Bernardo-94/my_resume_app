class ProfessionalExpertiseModel {
  final int id;
  final String occupation;
  final String company;
  final String duration;
  final String address;
  final List<String> skills;

  ProfessionalExpertiseModel({
    required this.id,
    required this.occupation,
    required this.company,
    required this.duration,
    required this.address,
    required this.skills,
  });

  factory ProfessionalExpertiseModel.fromJson(Map<String, dynamic> json) {
    List<String> skillsList = List<String>.from(
        json['skills'].map((dynamic skill) => skill.toString()));
    return ProfessionalExpertiseModel(
      id: json['id'],
      occupation: json['occupation'],
      company: json['company'],
      duration: json['duration'],
      address: json['address'],
      skills: skillsList,
    );
  }
}
