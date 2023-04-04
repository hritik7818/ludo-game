import 'package:bloc/bloc.dart';
import 'package:ludo_game/utilities/constants.dart';
import 'package:meta/meta.dart';

part 'second_player_peice_position_state.dart';

class SecondPlayerPeicesPositionsCubit
    extends Cubit<SecondPlayerPeicesPositionsState> {
  SecondPlayerPeicesPositionsCubit()
      : super(SecondPlayerPeicesPositionsState(
          firstPiecePostion: 41,
          secondPiecePostion: 42,
          thirdPiecePostion: 56,
          forthPiecePostion: 57,
        ));

  void setFirstPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.secondPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(SecondPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion == 41 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.secondPlayerPath[position + moveCount]
              [position + moveCount]!,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setSecondPiecePostion(int moveCount) {
    print("secondPiecePostion method called");
    int position = 0;
    for (var map in AppConstants.secondPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(SecondPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion == 42 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.secondPlayerPath[position + moveCount]
              [position + moveCount]!,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setThirdPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.secondPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(SecondPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion == 56 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.secondPlayerPath[position + moveCount]
              [position + moveCount]!,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setForthPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.secondPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(SecondPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion == 57 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.secondPlayerPath[position + moveCount]
              [position + moveCount]!,
    ));
  }
}
