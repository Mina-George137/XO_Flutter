
import 'package:flutter/material.dart';
import 'package:xo_game/board_button.dart';
import 'package:xo_game/game_board.dart';


class GameBoard extends StatefulWidget{
  static const routeName = 'game_board';

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> boardState = ['','','','','','','','',''];
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GameBoardArgs ;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
        centerTitle: true,
        actions: [
          ElevatedButton(onPressed: initGame, child: Text('Reset')),
        ],
      ),

      body:Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.player1} (X)',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('$player1Score',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),)

                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('${args.player2} (O)',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),
                    Text('$player2Score',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),)

                  ],
                )


              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                    BoardButton(text: boardState[0],index: 0,onButtonClick: onButtonClicked ),
                    BoardButton(text: boardState[1],index: 1,onButtonClick: onButtonClicked ),
                    BoardButton(text: boardState[2],index: 2,onButtonClick: onButtonClicked ),

              ],
            ),
          ),
          Expanded(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                    BoardButton(text: boardState[3],index: 3,onButtonClick: onButtonClicked ),
                    BoardButton(text: boardState[4],index: 4,onButtonClick: onButtonClicked ),
                    BoardButton(text: boardState[5],index: 5,onButtonClick: onButtonClicked ),

              ],
            ),
          ),
          Expanded(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                    BoardButton(text: boardState[6],index: 6,onButtonClick: onButtonClicked ),
                    BoardButton(text: boardState[7],index: 7,onButtonClick: onButtonClicked ),
                    BoardButton(text: boardState[8],index: 8,onButtonClick: onButtonClicked ),

              ],
            ),
          ),

        ],
      ),

    );
  }

  int counter = 0;

  void onButtonClicked(int index){
    if(boardState[index].isNotEmpty){
      return ;
    }
    if (counter%2==0){
      //  Play X
      boardState[index] = 'X';
    }else{
      // Play O
      boardState[index] = 'O';

    }

    counter ++;
    if(checkWinner('X')){
      player1Score ++;
      initBoard();
    }else if(checkWinner('O')){
      player2Score++;
      initBoard();
    }else if(counter == 9){
      initBoard();
    }
    setState((){});
  }

  /// 0 1 2
  /// 3 4 5
  /// 6 7 8
  bool checkWinner(String symbol){
    /// Check for rows
    for(int i = 0 ; i < 9;i+=3){
      if (boardState[i]==symbol && boardState[i+1]==symbol && boardState[i+2]==symbol){
        return true;
      }
    }
    /// Check for columns
    for(int i = 0 ; i < 3;i++){
      if (boardState[i]==symbol && boardState[i+3]==symbol && boardState[i+6]==symbol){
        return true;
      }
    }
    ///Check for diagonals
    if (boardState[0]==symbol && boardState[4]==symbol && boardState[8]==symbol){
      return true;
    }
    if (boardState[2]==symbol && boardState[4]==symbol && boardState[6]==symbol){
      return true;
    }
    return false;
  }

  void initBoard(){
    boardState = ['','','','','','','','',''];
    counter =0;
    setState((){});
  }

  void initGame(){
    boardState = ['','','','','','','','',''];
    counter =0;
    player2Score = 0;
    player1Score = 0;
    setState((){});
  }
}

/// Data class or model
class GameBoardArgs{
  String player1;
  String player2;
  GameBoardArgs({required this.player1, required this.player2});
}