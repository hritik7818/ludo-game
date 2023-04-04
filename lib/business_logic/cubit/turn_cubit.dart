import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'turn_state.dart';

class TurnCubit extends Cubit<TurnState> {
  TurnCubit() : super(TurnState(turn: "player")) {}

  void setTurnToFirst() {
    emit(TurnState(turn: "first"));
  }

  void setTurnToSecond() {
    emit(TurnState(turn: "second"));
  }

  void setTurnToPlayer() {
    emit(TurnState(turn: "player"));
  }

  void setTurnToForth() {
    emit(TurnState(turn: "forth"));
  }
}
