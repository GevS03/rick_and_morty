import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_clean/features/persons/domain/entities/person_entity.dart';

import '../../../../core/error/failure.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<Person>>> getAllPersons();
}