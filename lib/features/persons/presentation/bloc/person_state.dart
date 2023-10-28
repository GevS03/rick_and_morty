// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'person_bloc.dart';

sealed class PersonState extends Equatable {
  const PersonState();
  
  @override
  List<Object> get props => [];
}

final class PersonInitial extends PersonState {}

class LoadingPersonsState extends PersonState {}

class LoadedPersonsState extends PersonState {
  final List<Person> persons;
  LoadedPersonsState({
    required this.persons,
  });
}

class ErrorPersonsState extends PersonState {
  final String messige;

  ErrorPersonsState({required this.messige});
}