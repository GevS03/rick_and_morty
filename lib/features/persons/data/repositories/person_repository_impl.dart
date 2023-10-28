// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_clean/core/error/exception.dart';

import 'package:rick_and_morty_clean/core/error/failure.dart';
import 'package:rick_and_morty_clean/core/network/network_info.dart';
import 'package:rick_and_morty_clean/features/persons/data/data_sources/local_data_sources.dart';
import 'package:rick_and_morty_clean/features/persons/data/data_sources/remote_data_sources.dart';
import 'package:rick_and_morty_clean/features/persons/domain/entities/person_entity.dart';
import 'package:rick_and_morty_clean/features/persons/domain/repositories/person_repository.dart';

class PersonrepositoryImpl implements PersonRepository {
  final PersonLocaldataSource localdataSource;
  final PersonRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  PersonrepositoryImpl({
    required this.localdataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Person>>> getAllPersons() async{
    if(await networkInfo.isConnected) {
      try{
        final remotePersons = await remoteDataSource.getAllPersons();
        localdataSource.cachePerson(remotePersons);
        return Right(remotePersons);
      }on ServerException {
        return Left(ServerFailure());
      }
    }else {
      try {
        final localPost = await localdataSource.getCachedPersons();
        return Right(localPost);
      }on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
