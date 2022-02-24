
import 'dart:async';
import 'dart:math';

import 'package:flutterapp/timer.dart';
import 'package:just_audio/just_audio.dart';

import 'tile.dart';
import 'package:flutter/material.dart';


class CatPuzzle extends StatefulWidget {

  const CatPuzzle({Key? key}) : super(key: key);

  @override
  createState() => _PuzzleState();
}

class _PuzzleState extends State<CatPuzzle> {
  int x = 0;
  int y = 0;
  int init = 1;
  int move = 0;
  int win = 0;
  int level = 1;
  String title = 'Welcome';

  List<Tile> list = [];

  List<Tile> _initPuzzel(int x, int y, int init) {

    // if win
    if(win == 16) {

      final player = AudioPlayer();
      var duration = player.setAsset('web/audios/success.mp3');
      player.play();

      Tile t1 = Tile();
      t1.value="w";
      t1.posX=1;
      t1.posY=0;

      Tile t2 = Tile();
      t2.value="i";
      t2.posX=2;
      t2.posY=0;

      Tile t3 = Tile();
      t3.value="n";
      t3.posX=3;
      t3.posY=0;

      Tile t4 = Tile();
      t4.value="!";
      t4.posX=3;
      t4.posY=0;

      list = [];
      list.add(t1);
      list.add(t2);
      list.add(t3);
      list.add(t4);

      title="win!- M : "+move.toString() ;

      return list;

    }

    Tile t1 = Tile();
    t1.value="01";
    t1.posX=1;
    t1.posY=0;

    Tile t2 = Tile();
    t2.value="02";
    t2.posX=2;
    t2.posY=0;

    Tile t3 = Tile();
    t3.value="03";
    t3.posX=3;
    t3.posY=0;

    Tile t4 = Tile();
    t4.value="04";
    t4.posX=4;
    t4.posY=0;

    Tile t5 = Tile();
    t5.value="05";
    t5.posX=5;
    t5.posY=0;

    Tile t6 = Tile();
    t6.value="06";
    t6.posX=6;
    t6.posY=0;

    Tile t7 = Tile();
    t7.value="07";
    t7.posX=7;
    t7.posY=0;

    Tile t8 = Tile();
    t8.value="08";
    t8.posX=8;
    t8.posY=0;

    Tile t9 = Tile();
    t9.value="09";
    t9.posX=9;
    t9.posY=0;

    Tile t10 = Tile();
    t10.value="10";
    t10.posX=10;
    t10.posY=0;

    Tile t11 = Tile();
    t11.value="11";
    t11.posX=11;
    t11.posY=0;

    Tile t12 = Tile();
    t12.value="12";
    t12.posX=12;
    t12.posY=0;

    Tile t13 = Tile();
    t13.value="13";
    t13.posX=13;
    t13.posY=0;

    Tile t14 = Tile();
    t14.value="14";
    t14.posX=14;
    t14.posY=0;

    Tile t15 = Tile();
    t15.value="15";
    t15.posX=15;
    t15.posY=0;

    Tile vide = Tile();
    vide.value="-";
    vide.posX=16;
    vide.posY=0;

    final List<Tile> listinti = [];
    listinti.add(t1);
    listinti.add(t2);
    listinti.add(t3);
    listinti.add(t4);

    listinti.add(t5);
    listinti.add(t6);
    listinti.add(t7);
    listinti.add(t8);

    listinti.add(t9);
    listinti.add(t10);
    listinti.add(t11);
    listinti.add(t12);

    listinti.add(t13);
    listinti.add(t14);
    listinti.add(t15);
    listinti.add(vide);

    if(init==1) {
      move = 0;
      win=0;
      title = 'Welcome';
      list = [];

      if(level==1) {

        int pos = 1;
        for(int j = 0; j<8; j++) {
          listinti.elementAt(j).posY=pos;
          list.add(listinti.elementAt(j));
          pos++;
        }

        final List<int> position = [9,10,11,12,13,14,15,16];
        for(int i = 9; i<17; i++) {

          Random rand = Random();
          int randomElement = position.elementAt(rand.nextInt(position.length));

          for(int j = 0; j<listinti.length; j++) {
            if(listinti.elementAt(j).posX==randomElement) {
              listinti.elementAt(j).posY=i;
              list.add(listinti.elementAt(j));
              position.remove(randomElement);
            }
          }
        }

      } else if (level==2) {
        int pos = 1;
        for(int j = 0; j<4; j++) {
          listinti.elementAt(j).posY=pos;
          list.add(listinti.elementAt(j));
          pos++;
        }

        final List<int> position = [5,6,7,8,9,10,11,12,13,14,15,16];
        for(int i = 5; i<17; i++) {

          Random rand = Random();
          int randomElement = position.elementAt(rand.nextInt(position.length));

          for(int j = 0; j<listinti.length; j++) {
            if(listinti.elementAt(j).posX==randomElement) {
              listinti.elementAt(j).posY=i;
              list.add(listinti.elementAt(j));
              position.remove(randomElement);
            }
          }
        }
      } else if (level==3) {
        final List<int> position = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
        for(int i = 1; i<17; i++) {
          Random rand = Random();
          int randomElement = position.elementAt(rand.nextInt(position.length));

          for(int j = 0; j<listinti.length; j++) {
            if(listinti.elementAt(j).posX==randomElement) {
              listinti.elementAt(j).posY=i;
              list.add(listinti.elementAt(j));
              position.remove(randomElement);
            }
          }
        }
      }

      return list;

    } else {

      for(int k = 0; k<list.length; k++) {
        if(list.elementAt(k).value=="-" && list.elementAt(k).posY==y) {

          int count = 0;
          win = 0;
          for(int k = 0; k<list.length; k++) {
            count++;
            if(list.elementAt(k).posX==count) {
              win = win + 1;
            }
          }
          title="M: "+move.toString() + " - W: "+win.toString();

          return list;
        }
      }

      List<Tile> listEntourned = [];
      List<Tile> result = [];
      Algo algo = Algo();
      listEntourned = algo._getEntourned(x,y,list,4);

      int exist = 0;
      for(int k = 0; k<listEntourned.length; k++) {
        if(listEntourned.elementAt(k).value=="-") {
          exist=1;
        }
      }

      // if not blanc
      if(exist==0) {

        final player = AudioPlayer();
        var duration = player.setAsset('web/audios/click.mp3');
        player.play();

        int count = 0;
        win = 0;
        for(int k = 0; k<list.length; k++) {
          count++;
          if(list.elementAt(k).posX==count) {
            win = win + 1;
          }
        }
        title="M: "+move.toString() + " - W: "+win.toString();

        return list;
      }

      final player = AudioPlayer();
      var duration = player.setAsset('web/audios/tile_move.mp3');
      player.play();

      for(int j = 0; j<listEntourned.length; j++) {
        // get blanc from entourned
        if(listEntourned.elementAt(j).value=="-") {
          Tile blanc = listEntourned.elementAt(j);

          for(int t = 0; t<list.length; t++) {
            //print(list.elementAt(t).posY);
            // get blanc from list
            if(list.elementAt(t).value=="-") {
              for(int i = 0; i<list.length; i++) {
                // get taped from list
                if(list.elementAt(i).posY==y) {
                  Tile taped = list.elementAt(i);
                  result.add(taped);
                }
              }
            } else if(list.elementAt(t).posY==y) {
              result.add(blanc);
            } else {
              result.add(list.elementAt(t));
            }
          }
          list = [];
          int count = 1;
          for(int k = 0; k<result.length; k++) {
            result.elementAt(k).posY=count;
            count++;
            list.add(result.elementAt(k));
          }
          move=move+1;
        }

      }
      int count = 0;
      win = 0;
      for(int k = 0; k<list.length; k++) {
        count++;
        if(result.elementAt(k).posX==count) {
          win = win + 1;
        }
      }
      title="M: "+move.toString() + " - W: "+win.toString();

      // if win
      if(win == 16) {

        final player = AudioPlayer();
        var duration = player.setAsset('web/audios/success.mp3');
        player.play();

        Tile t1 = Tile();
        t1.value="w";
        t1.posX=1;
        t1.posY=0;

        Tile t2 = Tile();
        t2.value="i";
        t2.posX=2;
        t2.posY=0;

        Tile t3 = Tile();
        t3.value="n";
        t3.posX=3;
        t3.posY=0;

        Tile t4 = Tile();
        t4.value="!";
        t4.posX=3;
        t4.posY=0;

        list = [];
        list.add(t1);
        list.add(t2);
        list.add(t3);
        list.add(t4);

        title="win!- M : "+move.toString() ;

        return list;

      }

      return list;
    }
  }

  Color setColor(String index){
    if(index=="-") {
      return Colors.white;
    } else {
      return Colors.blue;
    }
  }

  String getText(String input) {
    if(input=="-") {
      return "";
    } else {
      return input;
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  init=1;
                  level=1;
                  win=0;
                  title="Welcome";
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  init=1;
                  level=2;
                  win=0;
                  title="Welcome";
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  init=1;
                  level=3;
                  win=0;
                  title="Welcome";
                });
              },
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.center,
            child: StopWatch(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child :GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 4,
          //childAspectRatio: (1 / .4),
          children: _initPuzzel(x,y,init).map((f) => InkWell(
            // Handle your callback
            onTap: (){
              Future.delayed(const Duration(milliseconds: 120), () {
                setState(() {
                  x=f.posX;
                  y=f.posY;
                  title="M: "+move.toString() + " - W: "+win.toString();
                  init=0;
                  _initPuzzel(x,y,init);
                });
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Align(
                child: Text(
                  //alignment: Alignment(f.posX, f.posY),
                  getText(f.value),
                  textScaleFactor: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              height: 120.0,
              width: 120.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 5.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                //color: setColor(f.value),
                image: DecorationImage(
                  image: AssetImage("web/images/cat/cute/"+f.value+".png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ))
              .toList(),
        ),
      ),
    ],
        ),
      ),
    );
  }
}


class Algo {

  List<int> _getPoseNotMultiple(int y, int size) {
    List<int> list = [];

    int count = 0;
    while(y % size != 0) {
      y = y-1;
      count=count+1;
    }
    if(count<3) {
      list.add(count+1);
    } else {
      list.add(count);
    }

    count = 0;
    while(y % size != 0) {
      y = y-1;
      count=count+1;
    }
    if(count<3) {
      list.add(count+1);
    } else {
      list.add(count);
    }

    return list;
  }

  int _getValuePosePlusNotMultiple(int pose, int y, int size) {

    int result = 0;
    int count = 0;
    while(y % size != 0) {
      y = y+1;
      count=count+1;
    }
    if(count<2) {
      result = y+pose+2;
    } else {
      result = y+pose+1;
    }

    return result;
  }

  int _getValuePoseMinusNotMultiple(int pose, int y, int size) {

    int result = 0;
    int count = 0;
    while(y % size != 0) {
      y = y-1;
      count=count+1;
    }
    if(count<3) {
      result = y-pose+1;
    } else {
      result = y-pose+2;
    }

    return result;
  }

  List<Tile> _getEntourned(int x, int y, List<Tile> input, int size) {

    List<Tile> list = [];

    if(y==(size*size)) {
      // coin
      for(int i = 0; i<input.length; i++) {
        if(input.elementAt(i).posY==(y)) {
          list.add(input.elementAt(i-1));
        }
        if(input.elementAt(i).posY==(y-size)) {
          list.add(input.elementAt(i));
        }
      }
    } else if(y==size) {
      // coin
      for(int i = 0; i<input.length; i++) {
        if(input.elementAt(i).posY==(y)) {
          list.add(input.elementAt(i-1));
        }
        if(input.elementAt(i).posY==(y+size)) {
          list.add(input.elementAt(i));
        }
      }
    } else if(y==(size*(size-1)+1)) {
      // coin
      for(int i = 0; i<input.length; i++) {
        if(input.elementAt(i).posY==(y)) {
          list.add(input.elementAt(i+1));
        }
        if(input.elementAt(i).posY==(y-size)) {
          list.add(input.elementAt(i));
        }
      }
    } else if ((y-1) % size == 0) {
      // border start
      if(y==1) {
        for(int i = 0; i<input.length; i++) {
          if(input.elementAt(i).posY==(y)) {
            list.add(input.elementAt(i+1));
          }
          if(input.elementAt(i).posY==(y+size)) {
            list.add(input.elementAt(i));
          }
        }
      } else {
        // border start
        for(int i = 0; i<input.length; i++) {
          if(input.elementAt(i).posY==(y+1)) {
            list.add(input.elementAt(i));
          }
          if(input.elementAt(i).posY==(y-size)) {
            list.add(input.elementAt(i));
          }
          if(input.elementAt(i).posY==(y+size)) {
            list.add(input.elementAt(i));
          }
        }
      }

    } else if (y % size == 0) {
      // border end
      for(int i = 0; i<input.length; i++) {
        if(input.elementAt(i).posY==(y-1)) {
          list.add(input.elementAt(i));
        }
        if(input.elementAt(i).posY==(y-size)) {
          list.add(input.elementAt(i));
        }
        if(input.elementAt(i).posY==(y+size)) {
          list.add(input.elementAt(i));
        }
      }
    } else {
      for(int i = 0; i<input.length; i++) {
        if(input.elementAt(i).posY==(y-1)) {
          list.add(input.elementAt(i));
        }
        if(input.elementAt(i).posY==(y+1)) {
          list.add(input.elementAt(i));
        }
      }
      if(y % size < size*2) {
        List<int> listpose = _getPoseNotMultiple(y,4);
        for(int i = 0; i<input.length; i++) {
          if(input.elementAt(i).posY==_getValuePosePlusNotMultiple(listpose.elementAt(1), y , size)) {
            list.add(input.elementAt(i));
          }
        }
        for(int i = 0; i<input.length; i++) {
          if(input.elementAt(i).posY==_getValuePoseMinusNotMultiple(listpose.elementAt(0), y , size)) {
            list.add(input.elementAt(i));
          }
        }
      }

    }
    return list;
  }
}
