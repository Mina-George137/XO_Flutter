import 'package:flutter/material.dart';
import 'package:xo_game/game_board.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = 'player_screen';
  String player1Name ='';
  String player2Name ='';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Players'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (text){
                player1Name = text;
              },
              decoration: InputDecoration(labelText: 'Enter player name'),
            ),
            TextField(
              onChanged: (text){
                player2Name = text;
              },
              decoration: InputDecoration(labelText: 'Enter player name'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(GameBoard.routeName,
                  arguments: GameBoardArgs(player1: player1Name, player2: player2Name)
                  );
                },
                child: Text('Let\'s play'))
          ],
        ),
      ),
    );
  }
}
