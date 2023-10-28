// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_clean/features/persons/domain/entities/person_entity.dart';
import 'package:rick_and_morty_clean/features/persons/domain/repositories/person_repository.dart';

import '../../../../core/error/failure.dart';

class GetAllPersonsUseCase {
  final PersonRepository repository;
  GetAllPersonsUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Person>>> call() {
    return repository.getAllPersons();
  }
}
