import 'package:bloc/bloc.dart';
import 'package:ludo_game/utilities/constants.dart';
import 'package:meta/meta.dart';

part 'player_peices_positions_state.dart';

class PlayerPeicesPositionsCubit extends Cubit<PlayerPeicesPositionsState> {
  PlayerPeicesPositionsCubit()
      : super(PlayerPeicesPositionsState(
          firstPiecePostion: 167,
          secondPiecePostion: 168,
          thirdPiecePostion: 182,
          forthPiecePostion: 183,
        ));

  void setFirstPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.playerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    print("position: $position");
    print("move count value is ${moveCount}");
    print("arr : ${AppConstants.playerPath[position + moveCount]}");
    print(
        "target index when peice is in home : ${AppConstants.playerPath[0][1]!}");
    print(
        "target index value is ${(AppConstants.playerPath[position + moveCount])[position + moveCount]}");
    emit(PlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion == 167 && moveCount == 6
          ? AppConstants.playerPath[0][1]!
          : (AppConstants
                  .playerPath[position + moveCount])[position + moveCount] ??
              171,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setSecondPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.playerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(PlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion == 168 && moveCount == 6
          ? AppConstants.playerPath[0][1]!
          : AppConstants.playerPath[position + moveCount]
              [position + moveCount]!,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setThirdPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.playerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(PlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion == 182 && moveCount == 6
          ? AppConstants.playerPath[0][1]!
          : AppConstants.playerPath[position + moveCount]
              [position + moveCount]!,
      forthPiecePostion: state.forthPiecePostion,
    ));
  }

  void setForthPiecePostion(int moveCount) {
    int position = 0;
    for (var map in AppConstants.playerPath) {
      if (map.containsValue(state.firstPiecePostion)) {
        position = map.keys.firstWhere(
          (k) => map[k] == state.firstPiecePostion,
        );
        break;
      }
    }
    emit(PlayerPeicesPositionsState(
      firstPiecePostion: state.firstPiecePostion,
      secondPiecePostion: state.secondPiecePostion,
      thirdPiecePostion: state.thirdPiecePostion,
      forthPiecePostion: state.forthPiecePostion == 183 && moveCount == 6
          ? AppConstants.playerPath[0][1]!
          : AppConstants.playerPath[position + moveCount]
              [position + moveCount]!,
    ));
  }
}
