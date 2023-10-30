import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:puzzle_zig_saw_game/level3X3.dart';
import 'package:puzzle_zig_saw_game/level4X4.dart';
import 'package:puzzle_zig_saw_game/level5.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashBoard(),
  ));
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  void initState() {
    // TODO: implement initState
    super.initState();
    get_Permit();
  }
  get_Permit() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      //print(statuses[Permission.location]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "zig saw Puzzle",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Level_Page();
                },));
              },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "3 X 3",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Level4();
                },));
              },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "4 X 4",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Level5();
                },));
              },
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "5 X 5",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}