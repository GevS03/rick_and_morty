import 'package:rick_and_morty_clean/features/persons/domain/entities/person_entity.dart';

class PersonModel extends Person {
  const PersonModel({required super.name, required super.gender, required super.image, required super.id});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(name: json['name'], gender: json['gender'], image: json['image'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'gender' : gender,
    };
  }
}