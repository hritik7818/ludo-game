import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_colors_state.dart';

class PlayerColorsCubit extends Cubit<PlayerColorsState> {
  PlayerColorsCubit()
      : super(PlayerColorsState(
          playerColor: Colors.white,
          firstPlayerColor: Colors.white,
          secondPlayerColor: Colors.white,
          forthPlayerColor: Colors.white,
          isColorSelected: false,
        )) {
    if (state.playerColor == Colors.blue[700]) {
      setPlayerColorBlue();
    } else if (state.playerColor == Colors.green[700]) {
      setPlayerColorGreen();
    } else if (state.playerColor == Colors.red[700]) {
      setPlayerColorRed();
    } else {
      setPlayerColorYellow();
    }
  }

  void setPlayerColorGreen() {
    emit(PlayerColorsState(
      playerColor: Colors.green[700]!,
      firstPlayerColor: Colors.red[700]!,
      secondPlayerColor: Colors.yellow[700]!,
      forthPlayerColor: Colors.blue[700]!,
      isColorSelected: false,
    ));
  }

  void setPlayerColorRed() {
    emit(PlayerColorsState(
      playerColor: Colors.red[700]!,
      firstPlayerColor: Colors.yellow[700]!,
      secondPlayerColor: Colors.blue[700]!,
      forthPlayerColor: Colors.green[700]!,
      isColorSelected: false,
    ));
  }

  void setPlayerColorYellow() {
    emit(PlayerColorsState(
      playerColor: Colors.yellow[700]!,
      firstPlayerColor: Colors.blue[700]!,
      secondPlayerColor: Colors.green[700]!,
      forthPlayerColor: Colors.red[700]!,
      isColorSelected: false,
    ));
  }

  void setPlayerColorBlue() {
    emit(PlayerColorsState(
      playerColor: Colors.blue[700]!,
      firstPlayerColor: Colors.green[700]!,
      secondPlayerColor: Colors.red[700]!,
      forthPlayerColor: Colors.yellow[700]!,
      isColorSelected: false,
    ));
  }

  void confirmPlayerColor() {
    emit(PlayerColorsState(
      playerColor: state.playerColor,
      firstPlayerColor: state.firstPlayerColor,
      secondPlayerColor: state.secondPlayerColor,
      forthPlayerColor: state.forthPlayerColor,
      isColorSelected: true,
    ));
  }
}
