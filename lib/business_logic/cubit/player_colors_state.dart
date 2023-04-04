part of 'player_colors_cubit.dart';

class PlayerColorsState {
  Color playerColor;
  Color firstPlayerColor;
  Color secondPlayerColor;
  Color forthPlayerColor;

  late Color playerBorderColor;
  late Color firstPlayerBorderColor;
  late Color secondPlayerBorderColor;
  late Color fourthPlayerBorderColor;
  bool isColorSelected;

  PlayerColorsState(
      {required this.playerColor,
      required this.firstPlayerColor,
      required this.secondPlayerColor,
      required this.forthPlayerColor,
      required this.isColorSelected}) {
    if (playerColor == Colors.blue[700]) {
      playerBorderColor = Colors.blue[400]!;
      firstPlayerBorderColor = Colors.green[400]!;
      secondPlayerBorderColor = Colors.red[400]!;
      fourthPlayerBorderColor = Colors.yellow[400]!;
    } else if (playerColor == Colors.green[700]) {
      playerBorderColor = Colors.green[400]!;
      firstPlayerBorderColor = Colors.red[400]!;
      secondPlayerBorderColor = Colors.yellow[400]!;
      fourthPlayerBorderColor = Colors.blue[400]!;
    } else if (playerColor == Colors.red[700]) {
      playerBorderColor = Colors.red[400]!;
      firstPlayerBorderColor = Colors.yellow[400]!;
      secondPlayerBorderColor = Colors.blue[400]!;
      fourthPlayerBorderColor = Colors.green[400]!;
    } else {
      playerBorderColor = Colors.yellow[400]!;
      firstPlayerBorderColor = Colors.blue[400]!;
      secondPlayerBorderColor = Colors.green[400]!;
      fourthPlayerBorderColor = Colors.red[400]!;
    }
  }
}
