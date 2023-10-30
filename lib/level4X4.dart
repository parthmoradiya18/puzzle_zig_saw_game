import 'package:flutter/material.dart';
import 'package:puzzle_zig_saw_game/data.dart';
import 'package:puzzle_zig_saw_game/logic_game.dart';
import 'package:puzzle_zig_saw_game/main.dart';

class Level4 extends StatefulWidget {
  const Level4({Key? key}) : super(key: key);

  @override
  State<Level4> createState() => _Level4State();
}

class _Level4State extends State<Level4> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: Text(
                  "Photo Puzzle",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black),
            body: ListView.builder(
              itemCount: Data.photo.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Game_Page(index);
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),
                        image: DecorationImage(
                            image: AssetImage("image/${Data.photo[index]}"),
                            fit: BoxFit.fill)),
                  ),
                );
              },
            ),
          )),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure you want to exit ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return DashBoard();
                        },
                      ));
                    },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
              ],
            );
          },
        );
        return true;
      },
    );
  }
}