import 'package:flutter/material.dart';
import '../Screens.dart';

class WorkstationAfterlogin extends StatefulWidget {
  const WorkstationAfterlogin({super.key});

  @override
  State<WorkstationAfterlogin> createState() => _WorkstationAfterloginState();
}

class _WorkstationAfterloginState extends State<WorkstationAfterlogin> {
  // final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    late double screenWidth = MediaQuery.of(context).size.width;
    // @override
    // void didChangeDependencies() {
    //   super.didChangeDependencies();
    //   screenWidth = MediaQuery.of(context).size.width;
    // }
    return Builder(
        builder: (context){
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer: Drawer(
                width: screenWidth * 0.135,
                child: Sidepanel(screenWidth: screenWidth,),
              ),

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
                              const SizedBox(width:10,),
                              IconButton(
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                onPressed: (){
                                  // Sidepanel();
                                  _scaffoldKey.currentState?.openDrawer();
                                  // log('hello');
                                  // Sidetest();
                                },
                                icon: const Icon(Icons.menu,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              //User Logout/profile/Timepanel
                              const Spacer(),
                              const SizedBox(
                                width: 192.5,
                                // height: 90,
                                // color: Colors.blue[400],   
                                child: Row(
                                  children: [
                                    // WS_Logout_BTW(),
                                    // TDrop(),
                                    // IconProfile(),
                                    WS_TimePanel(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      bottom: 1,
                      right: 0,
                      child:NotificationSectionWs(),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: SizedBox(
                height: 20,
                child: BottomAppBar(
                  color: Colors.grey[800],
                ),
              ),
            ),
          );
        }
    );
  }
}
