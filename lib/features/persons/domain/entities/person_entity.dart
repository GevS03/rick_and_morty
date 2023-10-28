// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final int id;
  final String gender;
  final String image;
  const Person({
    required this.name,
    required this.gender,
    required this.image,
    required this.id
  });

  @override
  List<Object?> get props => [name, gender, image];
}
