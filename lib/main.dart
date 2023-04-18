import 'package:flutter/material.dart';
import 'package:xo_game/game_board.dart';
import 'package:xo_game/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO_GAME',
      debugShowCheckedModeBanner: false,
      initialRoute:PlayerScreen.routeName ,

      routes:{
        GameBoard.routeName  : (context) => GameBoard(),
        PlayerScreen.routeName : (context) => PlayerScreen()
      },
    );
  }
}

