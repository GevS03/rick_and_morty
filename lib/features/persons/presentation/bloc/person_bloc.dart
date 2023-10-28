import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_clean/features/persons/domain/entities/person_entity.dart';
import 'package:rick_and_morty_clean/features/persons/domain/use_cases/get_all_persons.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetAllPersonsUseCase getAllPersons;
  PersonBloc({required this.getAllPersons}) : super(PersonInitial()) {
    on<PersonEvent>((event, emit) async{
      if(event is GetAllPersonsEvent) {
        emit(LoadingPersonsState());

        final persons = await getAllPersons();
        persons.fold(
          (failure) {}, 
          (persons) {}
        );
      }else if(event is RefreshPersonsEvent) {

      }
    });
  }
}
