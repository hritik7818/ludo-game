import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ludo_game/business_logic/cubit/first_player_peices_positions_cubit.dart';
import 'package:ludo_game/business_logic/cubit/forth_player_peices_position_cubit.dart';
import 'package:ludo_game/business_logic/cubit/player_peices_positions_cubit.dart';
import 'package:ludo_game/business_logic/cubit/second_player_peice_position_cubit.dart';
import 'package:meta/meta.dart';

part 'dice_value_state.dart';

class DiceValueCubit extends Cubit<DiceValueState> {
  DiceValueCubit()
      : super(DiceValueState(
          faceValue: Random().nextInt(6) + 1,
          isFinalValue: false,
        ));

  void generateNewDiceValue() {
    Timer _timer;
    int _start = 10;

    _timer = new Timer.periodic(
      Duration(milliseconds: 100),
      (Timer timer) {
        if (_start == 0) {
          emit(DiceValueState(
            faceValue: Random().nextInt(6) + 1,
            isFinalValue: true,
          ));
          timer.cancel();
        } else {
          emit(DiceValueState(
            faceValue: Random().nextInt(6) + 1,
            isFinalValue: false,
          ));
          _start--;
        }
      },
    );
  }
}
