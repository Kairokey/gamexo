import 'package:flutter/material.dart';
void main(){
  runApp(GameXANDO());
}
class GameXANDO extends StatefulWidget {
  @override
  _GameXANDOState createState() => _GameXANDOState();
}

class _GameXANDOState extends State<GameXANDO> {
  List<String>input=List.filled(9, '');
  bool turn=false;
  String winner="";
  int XScore=0;
  int OScore=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[850],
          body: Column(
            children: [
              Expanded(flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('Player X',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                            Text(XScore.toString(),style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text('Player O',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                            Text(OScore.toString(),style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(flex: 7,

                child: Container(


                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ) ,
                    itemBuilder: (context,index)
                    {

                      return InkWell(
                        onTap: () {
                          if (turn && input [index] == '') {
                            setState(() {
                              input[index] = "O";
                            });
                          }
                          else if (!turn && input [index] == '') {
                            setState(() {
                              input[index] = "X";
                            });
                          }
                          turn = !turn;
                          checkwinner();
                          Score();

                        },
                        child: (
                            Container(
                              decoration: BoxDecoration(
                                border:Border.all(
                                    color: Colors.white
                                ),
                              ),
                              child: Center(
                                child: Text(input[index],style: TextStyle(
                                    color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold
                                ),),
                              ),
                            )),
                      );
                    },
                  ),  ),
              ),
              Expanded(flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              PlayAgain();
                            },
                            child: Container(
                              height: 60,
                              width: 350,
                              child: Center(child: Text("Play Again",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            EndGame();
                          },
                          child: Container(     height: 60,
                            width: 350,
                            child: Center(child: Text("End Game",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
                            decoration: BoxDecoration(
                                color: Colors.red ,
                                borderRadius: BorderRadius.circular(30)
                            ),

                          ),
                        ),
                      ],
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
  checkwinner(){
    if (input[0] == input[1] && input[0] == input[2]&&input[0]!="") {
      setState(() {
        winner = input[0];
      });
    }
    else if(input[3]==input[4]&&input[3]==input[5]&&input[3]!=""){
      setState(() {
        winner = input[3];
      });
    }
    else if(input[6]==input[7]&&input[6]==input[8]&&input[6]!=""){
      setState(() {
        winner = input[6];
      });
    }
    else if(input[2]==input[4]&&input[2]==input[6]&&input[2]!=""){
      setState(() {
        winner = input[2];
      });
    }
    else if(input[0]==input[4]&&input[0]==input[8]&&input[0]!=""){
      setState(() {
        winner = input[0];
      });
    }
    else if(input[0]==input[3]&&input[0]==input[6]&&input[0]!=""){
      setState(() {
        winner = input[0];
      });
    }
    else if(input[1]==input[4]&&input[1]==input[7]&&input[1]!=""){
      setState(() {
        winner = input[1];
      });
    }
    else if(input[2]==input[5]&&input[2]==input[8]&&input[2]!=""){
      setState(() {
        winner = input[2];

      });
    }
  }
  Score() {
    if (winner == 'X') {
      setState(() {
        XScore++;
        PlayAgain();
      });
    }
    else if (winner == "O") {
      setState(() {
        OScore++;
        PlayAgain();
      });
    }
  }
  PlayAgain() {
    for (int i = 0; i < input.length; i += 1) {
      setState(() {
        input[i] = "";
        winner = "";
      });
    }
  }
  EndGame() {
    for (int i = 0; i < input.length; i += 1) {
      setState(() {
        input[i] = "";
        winner = "";
        XScore = 0;
        OScore = 0;
      });
    }
  }
}

