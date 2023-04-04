import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_game/business_logic/cubit/dice_value_cubit.dart';
import 'package:ludo_game/business_logic/cubit/first_player_peices_positions_cubit.dart';
import 'package:ludo_game/business_logic/cubit/forth_player_peices_position_cubit.dart';
import 'package:ludo_game/business_logic/cubit/player_colors_cubit.dart';
import 'package:ludo_game/business_logic/cubit/player_peices_positions_cubit.dart';
import 'package:ludo_game/business_logic/cubit/second_player_peice_position_cubit.dart';
import 'package:ludo_game/business_logic/cubit/turn_cubit.dart';
import 'package:ludo_game/presentation/screens/game_page.dart';

import 'business_logic/cubit/number_of_players_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayerColorsCubit>(
            create: (context) => PlayerColorsCubit()),
        BlocProvider<FirstPlayerPeicesPositionsCubit>(
            create: (context) => FirstPlayerPeicesPositionsCubit()),
        BlocProvider<SecondPlayerPeicesPositionsCubit>(
            create: (context) => SecondPlayerPeicesPositionsCubit()),
        BlocProvider<PlayerPeicesPositionsCubit>(
            create: (context) => PlayerPeicesPositionsCubit()),
        BlocProvider<ForthPlayerPeicesPositionsCubit>(
            create: (context) => ForthPlayerPeicesPositionsCubit()),
        BlocProvider<DiceValueCubit>(create: (context) => DiceValueCubit()),
        BlocProvider<TurnCubit>(create: (context) => TurnCubit()),
        BlocProvider<NumberOfPlayersCubit>(
            create: (context) => NumberOfPlayersCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GamePage(),
      ),
    );
  }
}
