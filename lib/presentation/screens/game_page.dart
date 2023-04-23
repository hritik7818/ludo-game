import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/dice_value_cubit.dart';
import '../../business_logic/cubit/first_player_peices_positions_cubit.dart';
import '../../business_logic/cubit/forth_player_peices_position_cubit.dart';
import '../../business_logic/cubit/number_of_players_cubit.dart';
import '../../business_logic/cubit/player_colors_cubit.dart';
import '../../business_logic/cubit/player_peices_positions_cubit.dart';
import '../../business_logic/cubit/second_player_peice_position_cubit.dart';
import '../../business_logic/cubit/turn_cubit.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MultiBlocListener(
          listeners: [
            BlocListener<DiceValueCubit, DiceValueState>(
              listener: (context, state) {
                if (state.faceValue == 6) {}
              },
            ),
          ],
          child: BlocBuilder<NumberOfPlayersCubit, NumberOfPlayersState>(
              builder: (context, numberOfPlayersState) {
            return BlocBuilder<DiceValueCubit, DiceValueState>(
                builder: (context, diceState) {
              return BlocBuilder<TurnCubit, TurnState>(
                  builder: (context, turnState) {
                return BlocBuilder<ForthPlayerPeicesPositionsCubit,
                        ForthPlayerPeicesPositionsState>(
                    builder: (context, forthPlayerPositionState) {
                  return BlocBuilder<PlayerPeicesPositionsCubit,
                          PlayerPeicesPositionsState>(
                      builder: (context, playerPositionState) {
                    return BlocBuilder<SecondPlayerPeicesPositionsCubit,
                            SecondPlayerPeicesPositionsState>(
                        builder: (context, secondPlayerPositionState) {
                      return BlocBuilder<FirstPlayerPeicesPositionsCubit,
                              FirstPlayerPeicesPositionsState>(
                          builder: (context, firstPlayerPositionState) {
                        return BlocBuilder<PlayerColorsCubit,
                            PlayerColorsState>(
                          builder: (context, playerColorState) {
                            print("player color: " +
                                playerColorState.playerColor.toString());
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  playerColorState.isColorSelected
                                      ? SizedBox()
                                      : Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Choose Color : ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        onPressed: context
                                                            .read<
                                                                PlayerColorsCubit>()
                                                            .setPlayerColorRed,
                                                        icon: Icon(
                                                            playerColorState
                                                                        .playerColor ==
                                                                    Colors.red[
                                                                        700]!
                                                                ? Icons.square
                                                                : Icons
                                                                    .circle_sharp,
                                                            color: Colors
                                                                .red[700])),
                                                    IconButton(
                                                        onPressed: context
                                                            .read<
                                                                PlayerColorsCubit>()
                                                            .setPlayerColorGreen,
                                                        icon: Icon(
                                                            playerColorState
                                                                        .playerColor ==
                                                                    Colors.green[
                                                                        700]!
                                                                ? Icons.square
                                                                : Icons
                                                                    .circle_sharp,
                                                            color: Colors
                                                                .green[700])),
                                                    IconButton(
                                                        onPressed: context
                                                            .read<
                                                                PlayerColorsCubit>()
                                                            .setPlayerColorBlue,
                                                        icon: Icon(
                                                            playerColorState
                                                                        .playerColor ==
                                                                    Colors.blue[
                                                                        700]!
                                                                ? Icons.square
                                                                : Icons
                                                                    .circle_sharp,
                                                            color: Colors
                                                                .blue[700])),
                                                    IconButton(
                                                        onPressed: context
                                                            .read<
                                                                PlayerColorsCubit>()
                                                            .setPlayerColorYellow,
                                                        icon: Icon(
                                                            playerColorState
                                                                        .playerColor ==
                                                                    Colors.yellow[
                                                                        700]
                                                                ? Icons.square
                                                                : Icons
                                                                    .circle_sharp,
                                                            color: Colors
                                                                .yellow[700])),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Number of Players : ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () => context
                                                            .read<
                                                                NumberOfPlayersCubit>()
                                                            .setNumberOfPlayers(
                                                                2),
                                                        icon: Icon(
                                                            numberOfPlayersState
                                                                        .numberOfPlayers ==
                                                                    2
                                                                ? Icons
                                                                    .looks_two_rounded
                                                                : Icons
                                                                    .looks_two_outlined,
                                                            color: playerColorState
                                                                .playerColor)),
                                                    IconButton(
                                                        onPressed: () => context
                                                            .read<
                                                                NumberOfPlayersCubit>()
                                                            .setNumberOfPlayers(
                                                                4),
                                                        icon: Icon(
                                                            numberOfPlayersState
                                                                        .numberOfPlayers ==
                                                                    4
                                                                ? Icons
                                                                    .looks_4_rounded
                                                                : Icons
                                                                    .looks_4_outlined,
                                                            color: playerColorState
                                                                .playerColor)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  color: playerColorState
                                                      .firstPlayerBorderColor,
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Colors.black)),
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  getPlayerColorName(
                                                      position: "first",
                                                      context: context),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              child: Container(
                                                width: 100,
                                                height: 20,
                                                // padding: EdgeInsets.zero,
                                                color: Colors.black,
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4, left: 12),
                                                  child: Text(
                                                    // getPlayerColorName(
                                                    //     position: "first",
                                                    //     context: context),
                                                    "taking turn... ",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  color: playerColorState
                                                      .secondPlayerBorderColor,
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Colors.black)),
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Text(
                                                  getPlayerColorName(
                                                      position: "second",
                                                      context: context),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 15,
                                      childAspectRatio: 1.0,
                                      mainAxisSpacing: 0.0,
                                      crossAxisSpacing: 0.0,
                                    ),
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) => index == 112
                                        ? GridView.count(
                                            padding: EdgeInsets.zero,
                                            crossAxisCount: 2,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    stops: [0.5, 0.5],
                                                    colors: [
                                                      playerColorState
                                                          .secondPlayerColor,
                                                      playerColorState
                                                          .firstPlayerColor,
                                                    ],
                                                  ),
                                                ),
                                                child: CustomPaint(
                                                  painter:
                                                      LinePainterCrossRight(),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    stops: [0.5, 0.5],
                                                    colors: [
                                                      playerColorState
                                                          .secondPlayerColor,
                                                      playerColorState
                                                          .forthPlayerColor
                                                    ],
                                                  ),
                                                ),
                                                child: CustomPaint(
                                                  painter:
                                                      LinePainterCrossLeft(),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    stops: [0.5, 0.5],
                                                    colors: [
                                                      playerColorState
                                                          .firstPlayerColor,
                                                      playerColorState
                                                          .playerColor
                                                    ],
                                                  ),
                                                ),
                                                child: CustomPaint(
                                                  painter:
                                                      LinePainterCrossLeft(),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    stops: [0.5, 0.5],
                                                    colors: [
                                                      playerColorState
                                                          .forthPlayerColor,
                                                      playerColorState
                                                          .playerColor,
                                                    ],
                                                  ),
                                                ),
                                                child: CustomPaint(
                                                  painter:
                                                      LinePainterCrossRight(),
                                                ),
                                              ),
                                            ],
                                          )
                                        : GestureDetector(
                                            onTap: () => manageMove(
                                                index: index,
                                                turn: turnState.turn,
                                                context: context,
                                                moveCount: diceState.faceValue,
                                                isFinalMoveValue:
                                                    diceState.isFinalValue),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    gradient: index == 96
                                                        ? LinearGradient(
                                                            begin: Alignment
                                                                .topRight,
                                                            end: Alignment
                                                                .bottomLeft,
                                                            stops: [0.5, 0.5],
                                                            colors: [
                                                              playerColorState
                                                                  .secondPlayerColor,
                                                              playerColorState
                                                                  .firstPlayerColor
                                                            ],
                                                          )
                                                        : index == 98
                                                            ? LinearGradient(
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight,
                                                                stops: [
                                                                  0.5,
                                                                  0.5
                                                                ],
                                                                colors: [
                                                                  playerColorState
                                                                      .secondPlayerColor,
                                                                  playerColorState
                                                                      .forthPlayerColor,
                                                                ],
                                                              )
                                                            : index == 126
                                                                ? LinearGradient(
                                                                    begin: Alignment
                                                                        .topLeft,
                                                                    end: Alignment
                                                                        .bottomRight,
                                                                    stops: [
                                                                      0.5,
                                                                      0.5
                                                                    ],
                                                                    colors: [
                                                                      playerColorState
                                                                          .firstPlayerColor,
                                                                      playerColorState
                                                                          .playerColor
                                                                    ],
                                                                  )
                                                                : index == 128
                                                                    ? LinearGradient(
                                                                        begin: Alignment
                                                                            .topRight,
                                                                        end: Alignment
                                                                            .bottomLeft,
                                                                        stops: [
                                                                          0.5,
                                                                          0.5
                                                                        ],
                                                                        colors: [
                                                                          playerColorState
                                                                              .forthPlayerColor,
                                                                          playerColorState
                                                                              .playerColor
                                                                        ],
                                                                      )
                                                                    : null,
                                                    color: getColor(index,
                                                        playerColorState),
                                                    border: getBorder(index),
                                                  ),
                                                  child: index == 96 ||
                                                          index == 128
                                                      ? CustomPaint(
                                                          painter:
                                                              LinePainterCrossRight(),
                                                        )
                                                      : index == 98 ||
                                                              index == 126
                                                          ? CustomPaint(
                                                              painter:
                                                                  LinePainterCrossLeft(),
                                                            )
                                                          : Center(
                                                              child: getBoxContent(
                                                                  index: index,
                                                                  playerColorState:
                                                                      playerColorState,
                                                                  firstPlayerPositionState:
                                                                      firstPlayerPositionState,
                                                                  secondPlayerPostionState:
                                                                      secondPlayerPositionState,
                                                                  playerPostionState:
                                                                      playerPositionState,
                                                                  forthPlayerPostionState:
                                                                      forthPlayerPositionState,
                                                                  turnState:
                                                                      turnState,
                                                                  diceState:
                                                                      diceState,
                                                                  context:
                                                                      context)),
                                                ),
                                                getPeice(
                                                    index: index,
                                                    playerColorState:
                                                        playerColorState,
                                                    firstPlayerPositionState:
                                                        firstPlayerPositionState,
                                                    secondPlayerPostionState:
                                                        secondPlayerPositionState,
                                                    playerPostionState:
                                                        playerPositionState,
                                                    forthPlayerPostionState:
                                                        forthPlayerPositionState,
                                                    turnState: turnState,
                                                    diceState: diceState,
                                                    context: context)
                                              ],
                                            ),
                                          ),
                                    itemCount: 225,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  color: playerColorState
                                                      .playerBorderColor,
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Colors.black)),
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  getPlayerColorName(
                                                      position: "player",
                                                      context: context),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                  color: playerColorState
                                                      .fourthPlayerBorderColor,
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Colors.black)),
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Text(
                                                  getPlayerColorName(
                                                      position: "forth",
                                                      context: context),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  // playerColorState.isColorSelected
                                  //     ? Padding(
                                  //         padding:
                                  //             const EdgeInsets.only(top: 40.0),
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.center,
                                  //           children: [
                                  //             InkWell(
                                  //               onTap: context
                                  //                   .read<DiceValueCubit>()
                                  //                   .generateNewDiceValue,
                                  //               child: Container(
                                  //                 decoration: BoxDecoration(
                                  //                   border:
                                  //                       Border.all(width: 1),
                                  //                   borderRadius:
                                  //                       BorderRadius.all(
                                  //                           Radius.circular(
                                  //                               10)),
                                  //                   color: playerColorState
                                  //                       .playerColor,
                                  //                 ),
                                  //                 width: 80,
                                  //                 height: 80,
                                  //                 child: Image.asset(
                                  //                   "assets/icons/dice-${diceState.faceValue}.png",
                                  //                   color: Colors.white,
                                  //                 ),
                                  //               ),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       )
                                  //     : SizedBox(),
                                  Visibility(
                                    visible: !playerColorState.isColorSelected,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        ElevatedButton(
                                          onPressed: context
                                              .read<PlayerColorsCubit>()
                                              .confirmPlayerColor,
                                          child: Text(
                                            "START",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  playerColorState.playerColor,
                                              fixedSize: Size(300, 50)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.add_circle_outlined,
                                            ),
                                            iconSize: 45,
                                          ),
                                          Text(
                                            "New Game",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            iconSize: 45,
                                          ),
                                          Text(
                                            "Settings",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            );
                          },
                        );
                      });
                    });
                  });
                });
              });
            });
          }),
        ),
      ),
    );
  }

  bool isGreenBorderIndex(index) {
    if ((index >= 0 && index <= 5) ||
        (index >= 75 && index <= 80) ||
        index == 15 ||
        index == 30 ||
        index == 45 ||
        index == 60 ||
        index == 20 ||
        index == 35 ||
        index == 50 ||
        index == 65) {
      return true;
    } else {
      return false;
    }
  }

  bool isRedBorderIndex(index) {
    if ((index >= 9 && index <= 14) ||
        (index >= 84 && index <= 89) ||
        index == 24 ||
        index == 39 ||
        index == 54 ||
        index == 69 ||
        index == 29 ||
        index == 44 ||
        index == 59 ||
        index == 74) {
      return true;
    } else {
      return false;
    }
  }

  bool isBlueBorderIndex(index) {
    if ((index >= 135 && index <= 140) ||
        (index >= 210 && index <= 215) ||
        index == 150 ||
        index == 165 ||
        index == 180 ||
        index == 195 ||
        index == 155 ||
        index == 170 ||
        index == 185 ||
        index == 200) {
      return true;
    } else {
      return false;
    }
  }

  bool isYellowBorderIndex(index) {
    if ((index >= 144 && index <= 149) ||
        (index >= 219 && index <= 224) ||
        index == 159 ||
        index == 174 ||
        index == 189 ||
        index == 204 ||
        index == 164 ||
        index == 179 ||
        index == 194 ||
        index == 209) {
      return true;
    } else {
      return false;
    }
  }

  bool isGreenBoxBorder(index) {
    if ((index >= 16 && index <= 19) ||
        (index >= 61 && index <= 64) ||
        index == 31 ||
        index == 46 ||
        index == 34 ||
        index == 49) {
      return true;
    } else {
      return false;
    }
  }

  bool isRedBoxBorder(index) {
    if ((index >= 25 && index <= 28) ||
        (index >= 70 && index <= 73) ||
        index == 40 ||
        index == 55 ||
        index == 43 ||
        index == 58) {
      return true;
    } else {
      return false;
    }
  }

  bool isBlueBoxBorder(index) {
    if ((index >= 151 && index <= 154) ||
        (index >= 196 && index <= 199) ||
        index == 166 ||
        index == 181 ||
        index == 169 ||
        index == 184) {
      return true;
    } else {
      return false;
    }
  }

  bool isYelowBoxBorder(index) {
    if ((index >= 160 && index <= 163) ||
        (index >= 205 && index <= 208) ||
        index == 175 ||
        index == 190 ||
        index == 178 ||
        index == 193) {
      return true;
    } else {
      return false;
    }
  }

  bool isGreenHomePath(index) {
    if ((index >= 106 && index <= 111) || index == 91) {
      return true;
    } else {
      return false;
    }
  }

  bool isRedHomePath(index) {
    if (index == 22 ||
        index == 23 ||
        index == 37 ||
        index == 52 ||
        index == 67 ||
        index == 82 ||
        index == 97) {
      return true;
    } else {
      return false;
    }
  }

  bool isBlueHomePath(index) {
    if (index == 127 ||
        index == 142 ||
        index == 157 ||
        index == 172 ||
        index == 187 ||
        index == 201 ||
        index == 202) {
      return true;
    } else {
      return false;
    }
  }

  bool isYellowHomePath(index) {
    if ((index >= 113 && index <= 118) || index == 133) {
      return true;
    } else {
      return false;
    }
  }

  bool isPointForSafe(index) {
    if (index == 36 || index == 102 || index == 188 || index == 122) {
      return true;
    } else {
      return false;
    }
  }

  Color getColor(
    index,
    playerColorState,
  ) {
    if (isGreenBorderIndex(index)) {
      return playerColorState.firstPlayerBorderColor;
    } else if (isRedBorderIndex(index)) {
      return playerColorState.secondPlayerBorderColor;
    } else if (isBlueBorderIndex(index)) {
      return playerColorState.playerBorderColor;
    } else if (isYellowBorderIndex(index)) {
      return playerColorState.fourthPlayerBorderColor;
    } else if (isGreenBoxBorder(index)) {
      return playerColorState.firstPlayerColor;
    } else if (isRedBoxBorder(index)) {
      return playerColorState.secondPlayerColor;
    } else if (isBlueBoxBorder(index)) {
      return playerColorState.playerColor;
    } else if (isYelowBoxBorder(index)) {
      return playerColorState.forthPlayerColor;
    } else if (isGreenHomePath(index)) {
      return playerColorState.firstPlayerColor;
    } else if (isRedHomePath(index)) {
      return playerColorState.secondPlayerColor;
    } else if (isBlueHomePath(index)) {
      return playerColorState.playerColor;
    } else if (isYellowHomePath(index)) {
      return playerColorState.forthPlayerColor;
    } else if (isPointForSafe(index)) {
      return Colors.black54;
    } else {
      return Colors.white;
    }
  }

  Widget getBoxContent({
    required index,
    required PlayerColorsState playerColorState,
    required FirstPlayerPeicesPositionsState firstPlayerPositionState,
    required SecondPlayerPeicesPositionsState secondPlayerPostionState,
    required PlayerPeicesPositionsState playerPostionState,
    required ForthPlayerPeicesPositionsState forthPlayerPostionState,
    required TurnState turnState,
    required DiceValueState diceState,
    required BuildContext context,
  }) {
    if (isPointForSafe(index) ||
        index == 91 ||
        index == 201 ||
        index == 133 ||
        index == 23) {
      return Icon(
        Icons.star_border,
        color: Colors.white,
      );
    } else if (index == 7) {
      return Icon(
        Icons.arrow_downward,
        color: playerColorState.secondPlayerColor,
      );
    } else if (index == 119) {
      return Icon(
        Icons.arrow_back,
        color: playerColorState.forthPlayerColor,
      );
    } else if (index == 217) {
      return Icon(
        Icons.arrow_upward,
        color: playerColorState.playerColor,
      );
    } else if (index == 105) {
      return Icon(
        Icons.arrow_forward,
        color: playerColorState.firstPlayerColor,
      );
    } else if (index == 32 ||
        index == 33 ||
        index == 47 ||
        index == 48 ||
        index == 41 ||
        index == 42 ||
        index == 56 ||
        index == 57 ||
        index == 167 ||
        index == 168 ||
        index == 182 ||
        index == 183 ||
        index == 176 ||
        index == 177 ||
        index == 191 ||
        index == 192) {
      return Icon(
        Icons.circle,
        color: Colors.grey,
      );
    } else {
      return SizedBox();
    }
  }

  bool isMovePossible(int index, DiceValueState diceState) {
    int moveCount = diceState.faceValue;
    if ((index == 167 ||
            index == 168 ||
            index == 182 ||
            index == 183 ||
            index == 32 ||
            index == 32 ||
            index == 47 ||
            index == 48 ||
            index == 41 ||
            index == 42 ||
            index == 56 ||
            index == 57 ||
            index == 176 ||
            index == 177 ||
            index == 191 ||
            index == 192) &&
        moveCount != 6 &&
        diceState.isFinalValue) {
      return false;
    } else if (index == 142 && moveCount > 1) {
      return false;
    } else if (index == 157 && moveCount > 2) {
      return false;
    } else if (index == 172 && moveCount > 3) {
      return false;
    } else if (index == 187 && moveCount > 4) {
      return false;
    } else if (index == 202 && moveCount > 5) {
      return false;
    } else if (index == 110 && moveCount > 1) {
      return false;
    } else if (index == 109 && moveCount > 2) {
      return false;
    } else if (index == 108 && moveCount > 3) {
      return false;
    } else if (index == 107 && moveCount > 4) {
      return false;
    } else if (index == 106 && moveCount > 5) {
      return false;
    } else if (index == 82 && moveCount > 1) {
      return false;
    } else if (index == 67 && moveCount > 2) {
      return false;
    } else if (index == 52 && moveCount > 3) {
      return false;
    } else if (index == 37 && moveCount > 4) {
      return false;
    } else if (index == 22 && moveCount > 5) {
      return false;
    } else if (index == 114 && moveCount > 1) {
      return false;
    } else if (index == 115 && moveCount > 2) {
      return false;
    } else if (index == 116 && moveCount > 3) {
      return false;
    } else if (index == 117 && moveCount > 4) {
      return false;
    } else if (index == 118 && moveCount > 5) {
      return false;
    } else if (diceState.isFinalValue == false) {
      return false;
    } else {
      return true;
    }
  }

  void setMoveToNextPlayer(BuildContext context) {
    if (context.read<TurnCubit>().state.turn == "first" &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 2) {
      context.read<TurnCubit>().setTurnToSecond();
    } else if (context.read<TurnCubit>().state.turn == "second" &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 2) {
      context.read<TurnCubit>().setTurnToPlayer();
    } else if (context.read<TurnCubit>().state.turn == "first" &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 4) {
      context.read<TurnCubit>().setTurnToSecond();
    } else if (context.read<TurnCubit>().state.turn == "second" &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 4) {
      context.read<TurnCubit>().setTurnToForth();
    } else if (context.read<TurnCubit>().state.turn == "forth" &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 4) {
      context.read<TurnCubit>().setTurnToPlayer();
    } else if (context.read<TurnCubit>().state.turn == "player" &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 4) {
      context.read<TurnCubit>().setTurnToFirst();
    }
  }

  void manageMove(
      {required int index,
      required BuildContext context,
      required String turn,
      required int moveCount,
      required bool isFinalMoveValue}) {
    if (!isMovePossible(index,
        DiceValueState(faceValue: moveCount, isFinalValue: isFinalMoveValue))) {
      print("move is not possible");
      return;
    }
    if (turn == "first" &&
        index ==
            context
                .read<FirstPlayerPeicesPositionsCubit>()
                .state
                .firstPiecePostion) {
      context
          .read<FirstPlayerPeicesPositionsCubit>()
          .setFirstPiecePostion(moveCount);
    }
    if (turn == "first" &&
        index ==
            context
                .read<FirstPlayerPeicesPositionsCubit>()
                .state
                .secondPiecePostion) {
      context
          .read<FirstPlayerPeicesPositionsCubit>()
          .setSecondPiecePostion(moveCount);
    } else if (turn == "first" &&
        index ==
            context
                .read<FirstPlayerPeicesPositionsCubit>()
                .state
                .thirdPiecePostion) {
      context
          .read<FirstPlayerPeicesPositionsCubit>()
          .setThirdPiecePostion(moveCount);
    } else if (turn == "first" &&
        index ==
            context
                .read<FirstPlayerPeicesPositionsCubit>()
                .state
                .forthPiecePostion) {
      context
          .read<FirstPlayerPeicesPositionsCubit>()
          .setForthPiecePostion(moveCount);
    } else if (turn == "second" &&
        index ==
            context
                .read<SecondPlayerPeicesPositionsCubit>()
                .state
                .firstPiecePostion) {
      context
          .read<SecondPlayerPeicesPositionsCubit>()
          .setFirstPiecePostion(moveCount);
    } else if (turn == "second" &&
        index ==
            context
                .read<SecondPlayerPeicesPositionsCubit>()
                .state
                .secondPiecePostion) {
      context
          .read<SecondPlayerPeicesPositionsCubit>()
          .setSecondPiecePostion(moveCount);
    } else if (turn == "second" &&
        index ==
            context
                .read<SecondPlayerPeicesPositionsCubit>()
                .state
                .thirdPiecePostion) {
      context
          .read<SecondPlayerPeicesPositionsCubit>()
          .setThirdPiecePostion(moveCount);
    } else if (turn == "second" &&
        index ==
            context
                .read<SecondPlayerPeicesPositionsCubit>()
                .state
                .forthPiecePostion) {
      context
          .read<SecondPlayerPeicesPositionsCubit>()
          .setForthPiecePostion(moveCount);
    } else if (turn == "forth" &&
        index ==
            context
                .read<ForthPlayerPeicesPositionsCubit>()
                .state
                .firstPiecePostion) {
      context
          .read<ForthPlayerPeicesPositionsCubit>()
          .setFirstPiecePostion(moveCount);
    } else if (turn == "forth" &&
        index ==
            context
                .read<ForthPlayerPeicesPositionsCubit>()
                .state
                .secondPiecePostion) {
      context
          .read<ForthPlayerPeicesPositionsCubit>()
          .setSecondPiecePostion(moveCount);
    } else if (turn == "forth" &&
        index ==
            context
                .read<ForthPlayerPeicesPositionsCubit>()
                .state
                .thirdPiecePostion) {
      context
          .read<ForthPlayerPeicesPositionsCubit>()
          .setThirdPiecePostion(moveCount);
    } else if (turn == "forth" &&
        index ==
            context
                .read<ForthPlayerPeicesPositionsCubit>()
                .state
                .forthPiecePostion) {
      context
          .read<ForthPlayerPeicesPositionsCubit>()
          .setForthPiecePostion(moveCount);
    } else if (turn == "player" &&
        index ==
            context
                .read<PlayerPeicesPositionsCubit>()
                .state
                .firstPiecePostion) {
      context
          .read<PlayerPeicesPositionsCubit>()
          .setFirstPiecePostion(moveCount);
    } else if (turn == "player" &&
        index ==
            context
                .read<PlayerPeicesPositionsCubit>()
                .state
                .secondPiecePostion) {
      context
          .read<PlayerPeicesPositionsCubit>()
          .setSecondPiecePostion(moveCount);
    } else if (turn == "player" &&
        index ==
            context
                .read<PlayerPeicesPositionsCubit>()
                .state
                .thirdPiecePostion) {
      context
          .read<PlayerPeicesPositionsCubit>()
          .setThirdPiecePostion(moveCount);
    } else if (turn == "player" &&
        index ==
            context
                .read<PlayerPeicesPositionsCubit>()
                .state
                .forthPiecePostion) {
      context
          .read<PlayerPeicesPositionsCubit>()
          .setForthPiecePostion(moveCount);
    } else {
      print("no condition satisfied");
    }
  }

  Widget getPeice({
    required index,
    required PlayerColorsState playerColorState,
    required FirstPlayerPeicesPositionsState firstPlayerPositionState,
    required SecondPlayerPeicesPositionsState secondPlayerPostionState,
    required PlayerPeicesPositionsState playerPostionState,
    required ForthPlayerPeicesPositionsState forthPlayerPostionState,
    required TurnState turnState,
    required DiceValueState diceState,
    required BuildContext context,
  }) {
    if ((index == firstPlayerPositionState.firstPiecePostion ||
            index == firstPlayerPositionState.secondPiecePostion ||
            index == firstPlayerPositionState.thirdPiecePostion ||
            index == firstPlayerPositionState.forthPiecePostion) &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 4) {
      if (turnState.turn == "first" && isMovePossible(index, diceState)) {
        return Icon(
          shadows: [
            Shadow(blurRadius: 50, color: Colors.black),
            Shadow(blurRadius: 50, color: Colors.black),
            Shadow(blurRadius: 50, color: Colors.white),
          ],
          Icons.run_circle_outlined,
          color: playerColorState.firstPlayerColor,
        );
      }
      return Stack(
        children: [
          Center(
            child: Icon(
              shadows: [
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.white),
              ],
              Icons.circle_sharp,
              color: playerColorState.firstPlayerColor,
            ),
          ),
          Center(
            child: Icon(
              size: 16,
              Icons.circle,
              color: Colors.white,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/icons/crown.png",
              color: playerColorState.firstPlayerColor,
              height: 8,
            ),
          ),
        ],
      );
    } else if (index == secondPlayerPostionState.firstPiecePostion ||
        index == secondPlayerPostionState.secondPiecePostion ||
        index == secondPlayerPostionState.thirdPiecePostion ||
        index == secondPlayerPostionState.forthPiecePostion) {
      if (turnState.turn == "second" && isMovePossible(index, diceState)) {
        return Icon(
          shadows: [
            Shadow(blurRadius: 10, color: Colors.black),
            Shadow(blurRadius: 10, color: Colors.black),
            Shadow(blurRadius: 10, color: Colors.white),
          ],
          Icons.run_circle_outlined,
          color: playerColorState.secondPlayerColor,
        );
      }
      return Stack(
        children: [
          Center(
            child: Icon(
              shadows: [
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.white),
              ],
              Icons.circle_sharp,
              color: playerColorState.secondPlayerColor,
            ),
          ),
          Center(
            child: Icon(
              size: 16,
              Icons.circle,
              color: Colors.white,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/icons/crown.png",
              color: playerColorState.secondPlayerColor,
              height: 8,
            ),
          ),
        ],
      );
    } else if (index == playerPostionState.firstPiecePostion ||
        index == playerPostionState.secondPiecePostion ||
        index == playerPostionState.thirdPiecePostion ||
        index == playerPostionState.forthPiecePostion) {
      if (turnState.turn == "player" && isMovePossible(index, diceState)) {
        return Icon(
          shadows: [
            Shadow(blurRadius: 10, color: Colors.black),
            Shadow(blurRadius: 10, color: Colors.black),
            Shadow(blurRadius: 10, color: Colors.white),
          ],
          Icons.run_circle,
          color: playerColorState.playerColor,
        );
      }
      return Stack(
        children: [
          Center(
            child: Icon(
              shadows: [
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.white),
              ],
              Icons.circle_sharp,
              color: playerColorState.playerColor,
            ),
          ),
          Center(
            child: Icon(
              size: 16,
              Icons.circle,
              color: Colors.white,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/icons/crown.png",
              color: playerColorState.playerColor,
              height: 8,
            ),
          ),
        ],
      );
    } else if ((index == forthPlayerPostionState.firstPiecePostion ||
            index == forthPlayerPostionState.secondPiecePostion ||
            index == forthPlayerPostionState.thirdPiecePostion ||
            index == forthPlayerPostionState.forthPiecePostion) &&
        context.read<NumberOfPlayersCubit>().state.numberOfPlayers == 4) {
      if (turnState.turn == "forth" &&
          isMovePossible(
            index,
            diceState,
          )) {
        return Icon(
          shadows: [
            Shadow(blurRadius: 10, color: Colors.black),
            Shadow(blurRadius: 10, color: Colors.black),
            Shadow(blurRadius: 10, color: Colors.white),
          ],
          Icons.run_circle_outlined,
          color: playerColorState.forthPlayerColor,
        );
      }
      return Stack(
        children: [
          Center(
            child: Icon(
              shadows: [
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.black),
                Shadow(blurRadius: 10, color: Colors.white),
              ],
              Icons.circle_sharp,
              color: playerColorState.forthPlayerColor,
            ),
          ),
          Center(
            child: Icon(
              size: 16,
              Icons.circle,
              color: Colors.white,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/icons/crown.png",
              color: playerColorState.forthPlayerColor,
              height: 8,
            ),
          ),
        ],
      );
    } else {
      return SizedBox(
          // child: Text(index.toString()),
          );
    }
  }

  getBorder(int index) {
    if (index >= 1 && index <= 5) {
      return Border(
          top: BorderSide(
        color: Colors.black,
        width: 2.0,
      ));
    }
    if (index >= 9 && index <= 13) {
      return Border(
          top: BorderSide(
        color: Colors.black,
        width: 2.0,
      ));
    }
    if (index >= 211 && index <= 215) {
      return Border(
          bottom: BorderSide(
        color: Colors.black,
        width: 2.0,
      ));
    }
    if (index >= 219 && index <= 223) {
      return Border(
          bottom: BorderSide(
        color: Colors.black,
        width: 2.0,
      ));
    }
    if (index % 15 == 0 &&
        index != 0 &&
        index != 210 &&
        index != 90 &&
        index != 105 &&
        index != 120) {
      return Border(
          left: BorderSide(
        color: Colors.black,
        width: 2.0,
      ));
    }
    if ((index + 1) % 15 == 0 &&
        index != 14 &&
        index != 224 &&
        index != 104 &&
        index != 119 &&
        index != 134) {
      return Border(
          right: BorderSide(
        color: Colors.black,
        width: 2.0,
      ));
    }
    if (index == 0) {
      return Border(
        top: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        left: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      );
    }
    if (index == 14) {
      return Border(
        top: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        right: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      );
    }

    if (index == 210) {
      return Border(
        bottom: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        left: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      );
    }

    if (index == 224) {
      return Border(
        bottom: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        right: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      );
    }
    if (index == 6 || index == 7 || index == 8) {
      print("index is 6 and top border is 2");
      return Border(
        top: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        right: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        bottom: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        left: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      );
    }
    if (index == 104 || index == 119 || index == 134) {
      return Border(
        top: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        right: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        bottom: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        left: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      );
    }
    if (index == 216 || index == 217 || index == 218) {
      return Border(
        top: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        right: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        bottom: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        left: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      );
    }
    if (index == 90 || index == 105 || index == 120) {
      return Border(
        top: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        right: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        bottom: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        left: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      );
    }
    if ((!(index == 96) &&
            !(index == 97) &&
            !(index == 98) &&
            !(index == 111) &&
            !(index == 112) &&
            !(index == 113) &&
            !(index == 126) &&
            !(index == 127) &&
            !(index == 128) &&
            !isBlueBorderIndex(index) &&
            !isBlueBoxBorder(index) &&
            !isGreenBorderIndex(index) &&
            !isGreenBoxBorder(index) &&
            !isYellowBorderIndex(index) &&
            !isYelowBoxBorder(index) &&
            !isRedBorderIndex(index) &&
            !isRedBoxBorder(index)) &&
        index != 32 &&
        index != 33 &&
        index != 47 &&
        index != 48 &&
        index != 41 &&
        index != 42 &&
        index != 56 &&
        index != 57 &&
        index != 167 &&
        index != 168 &&
        index != 182 &&
        index != 183 &&
        index != 176 &&
        index != 177 &&
        index != 191 &&
        index != 192) {
      return Border.all(
        width: 1,
        color: Colors.black,
      );
    }
  }

  String getPlayerColorName(
      {required position, required BuildContext context}) {
    if (position == "first") {
      if (context.read<PlayerColorsCubit>().state.firstPlayerColor ==
          Colors.yellow[700]) {
        return "Yellow";
      }
      if (context.read<PlayerColorsCubit>().state.firstPlayerColor ==
          Colors.green[700]) {
        return "Green";
      }
      if (context.read<PlayerColorsCubit>().state.firstPlayerColor ==
          Colors.red[700]) {
        return "Red";
      }
      return "Blue";
    } else if (position == "second") {
      if (context.read<PlayerColorsCubit>().state.secondPlayerColor ==
          Colors.yellow[700]) {
        return "Yellow";
      }
      if (context.read<PlayerColorsCubit>().state.secondPlayerColor ==
          Colors.green[700]) {
        return "Green";
      }
      if (context.read<PlayerColorsCubit>().state.secondPlayerColor ==
          Colors.red[700]) {
        return "Red";
      }
      return "Blue";
    } else if (position == "player") {
      if (context.read<PlayerColorsCubit>().state.playerColor ==
          Colors.yellow[700]) {
        return "Yellow";
      }
      if (context.read<PlayerColorsCubit>().state.playerColor ==
          Colors.green[700]) {
        return "Green";
      }
      if (context.read<PlayerColorsCubit>().state.playerColor ==
          Colors.red[700]) {
        return "Red";
      }
      return "Blue";
    } else {
      if (context.read<PlayerColorsCubit>().state.forthPlayerColor ==
          Colors.yellow[700]) {
        return "Yellow";
      }
      if (context.read<PlayerColorsCubit>().state.forthPlayerColor ==
          Colors.green[700]) {
        return "Green";
      }
      if (context.read<PlayerColorsCubit>().state.forthPlayerColor ==
          Colors.red[700]) {
        return "Red";
      }
      return "Blue";
    }
  }
}

class LinePainterCrossLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(0, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LinePainterCrossRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;
    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
