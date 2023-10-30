class ParagraphEntity {
  String id;
  String paragraph;

  ParagraphEntity({required this.id, required this.paragraph});

  ParagraphEntity.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        paragraph = map["paragraph"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "paragraph": paragraph,
    };
  }
}
