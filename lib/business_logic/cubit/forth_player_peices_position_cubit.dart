import 'package:bloc/bloc.dart';
import 'package:ludo_game/utilities/constants.dart';
import 'package:meta/meta.dart';

part 'forth_player_peices_position_state.dart';

class ForthPlayerPeicesPositionsCubit
    extends Cubit<ForthPlayerPeicesPositionsState> {
  ForthPlayerPeicesPositionsCubit()
      : super(ForthPlayerPeicesPositionsState(
          firstPiecePostion: 176,
          secondPiecePostion: 177,
          thirdPiecePostion: 191,
          forthPiecePostion: 192,
        ));

  void setFirstPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.forthPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(ForthPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion == 176 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.forthPlayerPath[position + moveCount]
              [position + moveCount]!,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setSecondPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.forthPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(ForthPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion == 177 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.forthPlayerPath[position + moveCount]
              [position + moveCount]!,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setThirdPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.forthPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(ForthPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion == 191 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.forthPlayerPath[position + moveCount]
              [position + moveCount]!,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setForthPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.forthPlayerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(ForthPlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion == 192 && moveCount == 6
          ? AppConstants.firstPlayerPath[0][1]!
          : AppConstants.forthPlayerPath[position + moveCount]
              [position + moveCount]!,
    ));
  }
}
