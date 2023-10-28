// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_clean/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rick_and_morty_clean/features/persons/data/models/person_model.dart';

abstract class PersonLocaldataSource {
  Future<List<PersonModel>> getCachedPersons();
  Future<Unit> cachePerson(List<PersonModel> personModel);
}

const cachedPersons = 'cached_persons';

class PersonLocaldataSourceImpl implements PersonLocaldataSource {
  final SharedPreferences sharedPreferences;
  PersonLocaldataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<Unit> cachePerson(List<PersonModel> personModel) {
    List personModelsToJson = personModel.map<Map<String, dynamic>>((personModel) => personModel.toJson()).toList();
    sharedPreferences.setString('cached_persons', jsonEncode(personModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PersonModel>> getCachedPersons() {
    final jsonString = sharedPreferences.getString(cachedPersons);
    if(jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PersonModel> jsonToPostModels = decodeJsonData.map<PersonModel>((jsonPersonModel) => PersonModel.fromJson(jsonPersonModel)).toList();
      return Future.value(jsonToPostModels);
    }else {
      throw EmptyCacheException();
    }
  }

}
