// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty_clean/core/error/exception.dart';

import 'package:rick_and_morty_clean/features/persons/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons();
}

const characterUrl = 'https://rickandmortyapi.com/api/character/';

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final http.Client client;
  PersonRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<List<PersonModel>> getAllPersons() async{
    final response = await client.get(Uri.parse(characterUrl));
    
    if (response.statusCode == 200) {
      List decodeJson = jsonDecode(response.body)['results'] as List;
      final List<PersonModel> personModels = decodeJson.map<PersonModel>((jsonPersonModel) => PersonModel.fromJson(jsonPersonModel)).toList();
      return personModels;
    }else {
      throw ServerException();
    }
  }

}
