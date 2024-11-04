import 'package:flutter/material.dart';
import '../Screens.dart';


class Workstation extends StatefulWidget {
  const Workstation({super.key});

  @override
  State<Workstation> createState() => _WorkstationState();
}

class _WorkstationState extends State<Workstation> with TickerProviderStateMixin {


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _drawerAnimationController;//Used for Drawer animation.


  @override
  void initState() {
    super.initState();
    _drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    // Show the LoginScreen Widget when Workstation is loaded....
    WidgetsBinding.instance.addPostFrameCallback((_) {
        showLoginDialog(context);

    });
  }
  @override
  void dispose() {
    _drawerAnimationController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // drawer: const Drawer(
        //   width: 220,
        //   child: Sidepanel_B_WS(),
        // ),

        drawer: AnimatedBuilder(
            animation: _drawerAnimationController,
            builder: (context, child){
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _drawerAnimationController,
                    curve: Curves.easeInOut,
                  )),
                child: child,
              );
            },
          child: SizedBox(
            width: screenWidth * 0.135,
            child: Sidepanel_B_WS(screenWidth: screenWidth,),
          ),
        ),
        onDrawerChanged: (isOpened){
          if(isOpened){
            _drawerAnimationController.forward();
          }
          else{
            _drawerAnimationController.reverse();
          }
        },

        body: Container(
          color: Colors.grey[900],
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.grey[500],
                    //changes app bar size.....
                    height: 25,
                    child: Row(
                      children: [
                        //Side menu panel....
                        SizedBox(width:10,),
                        IconButton(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          // onPressed: (){
                          //   _scaffoldKey.currentState?.openDrawer();
                          // },
                          onPressed: _toggleDrawer,
                          icon: Icon(Icons.menu,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        //User Logout/profile/Time panel
                        const Spacer(),
                        SizedBox(
                          width: 192.5,
                          child: Row(
                            children: [
                              WS_TimePanel(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              //Message notification Section is called..
              Positioned(
                bottom: 1,
                right: 0,
                child:NotificationSectionWs(),
              ),
            ],
          ),
        ),

        //Bottom grey boarder .....
        bottomNavigationBar: Container(
          height: 20,
          child: BottomAppBar(
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }

}



