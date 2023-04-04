import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_of_players_state.dart';

class NumberOfPlayersCubit extends Cubit<NumberOfPlayersState> {
  NumberOfPlayersCubit() : super(NumberOfPlayersState(numberOfPlayers: 2));

  void setNumberOfPlayers(int numberOfPlayers) {
    emit(NumberOfPlayersState(numberOfPlayers: numberOfPlayers));
  }
}
