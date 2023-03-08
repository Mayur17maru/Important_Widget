

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:notifiy/LOGIN.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        menuScreen: DrawerScreen(
          setIndex: (index){
            setState(() {
              currentIndex=index;
            });
          },
        ),
        mainScreen: currentScreen(),
    borderRadius: 35,
    showShadow: true,
    angle: 0.0,
    menuBackgroundColor: Colors.lightBlue,);
  }
  Widget currentScreen(){
     switch(currentIndex){
       case 0:
         return HomeScreen(title: 'HOME',);
       case 1:
         return Login();
       case 2:
         return HomeScreen(title: 'SENT',);
       case 3:
         return HomeScreen(title: 'ABOUT',);
       default:
         return HomeScreen(title: 'HOME',);
     }
  }
}
class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key? key, this.title="Home"}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: DrawerWidget(),
      ),
    );
  }
}
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);
  final ValueSetter setIndex;
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawerList(Icons.home_outlined,'Home',0),
          SizedBox(height: 12,),
          drawerList(Icons.inbox,'Inbox',1),
          SizedBox(height: 12,),
          drawerList(Icons.send,'Sent',2),
          SizedBox(height: 12,),
          drawerList(Icons.info,'About',3),
        ],
      ),
    );
  }
  Widget drawerList(IconData icon,String text,int index){
    return GestureDetector(
      onTap: (){
        widget.setIndex(index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          children:[Icon(icon,size: 35,),
            SizedBox(width: 11,),
            Text(text,style: TextStyle(fontSize: 35),),]

        ),
      ),
    );
  }
}
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      ZoomDrawer.of(context)!.toggle();
    }, icon: Icon(Icons.menu));
  }
}
