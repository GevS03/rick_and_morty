part of 'person_bloc.dart';

sealed class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class GetAllPersonsEvent extends PersonEvent {}

class RefreshPersonsEvent extends PersonEvent {}