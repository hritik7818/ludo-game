import 'package:bloc/bloc.dart';
import 'package:ludo_game/utilities/constants.dart';
import 'package:meta/meta.dart';

part 'first_player_peices_positions_state.dart';

class FirstPlayerPeicesPositionsCubit
    extends Cubit<FirstPlayerPeicesPositionsState> {
  FirstPlayerPeicesPositionsCubit()
      : super(FirstPlayerPeicesPositionsState(
          firstPiecePostion: 32,
          secondPiecePostion: 33,
          thirdPiecePostion: 47,
          forthPiecePostion: 48,
        ));
  void setFirstPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.firstPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(FirstPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion == 32 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.firstPlayerPath[position + moveCount]
              [position + moveCount]!,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setSecondPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.firstPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(FirstPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion == 33 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.firstPlayerPath[position + moveCount]
              [position + moveCount]!,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setThirdPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.firstPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(FirstPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion == 47 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.firstPlayerPath[position + moveCount]
              [position + moveCount]!,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setForthPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.firstPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(FirstPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion == 48 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.firstPlayerPath[position + moveCount]
              [position + moveCount]!,
    ));
  }
}
