import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../UI_Components/drawer_components.dart';
import '../Screens.dart';

//Before Login WS
class Sidepanel_B_WS extends StatefulWidget {
  const Sidepanel_B_WS({super.key, required this.screenWidth});
  final double screenWidth;

  @override
  State<Sidepanel_B_WS> createState() => _Sidepanel_B_WSState();
}

class _Sidepanel_B_WSState extends State<Sidepanel_B_WS> {
  int _expandedIndex = -1;// -1 means no section is expanded

  void _toggleExpansion(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = -1; // Collapse if tapping the same section
      } else {
        _expandedIndex = index; // Expand the tapped section
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: ListView(
        children: [
          buildDrawerHeader(widget.screenWidth),
          ExpandableTile(
              title: "PROFILE",
              icon: MdiIcons.accountCircle,
              isExpanded: _expandedIndex == 0,
              onTap: () => _toggleExpansion(0),
              screenWidth: widget.screenWidth,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ChildTile(
                    title: "LOGIN",
                    icon: MdiIcons.login,
                    onTap: () {
                      Navigator.of(context).pop();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showLoginDialog(context);
                      });
                      // log("Login");
                    }, screenWidth: widget.screenWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ChildTile(
                    title: "EXIT",
                    icon: MdiIcons.exitToApp,
                    onTap: () {
                      // log("EXIT");
                      exit(0);

                    }, screenWidth: widget.screenWidth,
                  ),
                ),
              ]),

          DrawerListTile(title: "ABOUT",
            icon: Icon(MdiIcons.information,
              size: widget.screenWidth * 0.015,
              color: Colors.black,
            ),
            press: (){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showAbouutDialog(context);
              });
            }, screenWidth: widget.screenWidth,
          ),
        ],
      ),
    );
  }

}





//After Login WS
class Sidepanel extends StatefulWidget {
  const Sidepanel({super.key, required this.screenWidth});
  final double screenWidth;
  @override
  State<Sidepanel> createState() => _SidepanelState();
}

class _SidepanelState extends State<Sidepanel> {
  int _expandedIndex = -1;
//  ensures that only one section is expanded at a time.
  void _toggleExpansion(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = -1; // Collapse if tapping the same section
      } else {
        _expandedIndex = index; // Expand the tapped section
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // controller: widget._controller,
      backgroundColor: Colors.grey[300],
      child: ListView(
        children: [

          buildDrawerHeader(widget.screenWidth),

          ExpandableTile(
              title: "PROFILE",
              icon: MdiIcons.accountCircle,
              isExpanded: _expandedIndex == 0,
              onTap: () => _toggleExpansion(0),
              screenWidth: widget.screenWidth,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ChildTile(
                    title: "LOGOUT",
                    icon: MdiIcons.logout,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Workstation()),
                      );
                      // Navigator.of(context).pop();
                      log("Logout");
                    }, screenWidth: widget.screenWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ChildTile(
                    title: "EXIT",
                    icon: MdiIcons.exitToApp,
                    onTap: () {
                      log("EXIT");
                      exit(0);
                    }, screenWidth: widget.screenWidth,
                  ),
                ),
              ]),

          ExpandableTile(
              title: "STRATEGY",
              icon: Icons.queue_rounded,
              isExpanded: _expandedIndex == 1,
              onTap: () => _toggleExpansion(1),
              screenWidth: widget.screenWidth,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ChildTile(
                    title: "Create Records",
                    icon: MdiIcons.filePlus,
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showAddedNewRecordsDialog(context);
                      });
                      Navigator.of(context).pop();
                      log("Create Records");
                    }, screenWidth: widget.screenWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ChildTile(
                    title: "Record Manager",
                    icon: MdiIcons.fileMultiple,
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showRecordManagerDialog(context);
                      });
                      Navigator.of(context).pop();
                      log("Record Manager");
                    }, screenWidth: widget.screenWidth,
                  ),
                ),
              ]),
          // const SizedBox(height: 30,),
          ExpandableTile(
            title: "REPORTS",
            icon: MdiIcons.notebookMultiple,
            isExpanded: _expandedIndex == 2,
            onTap: () => _toggleExpansion(2),
            screenWidth: widget.screenWidth,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child:ChildTile(
                  title: "Order Book",
                  icon: MdiIcons.notebook,
                  onTap: () {
                    Navigator.of(context).pop();
                    log("Order Book");
                  }, screenWidth: widget.screenWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ChildTile(
                  title: "Trade Book",
                  icon: MdiIcons.notebookEdit,
                  onTap: () {
                    Navigator.of(context).pop();
                    log("Trade Book");
                  }, screenWidth: widget.screenWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ChildTile(
                  title: "Net Position",
                  icon: MdiIcons.notebookCheck,
                  onTap: () {
                    Navigator.of(context).pop();
                    log("Net Position");
                  }, screenWidth: widget.screenWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ChildTile(
                  title: "Recordwise Trades",
                  icon: MdiIcons.fileArrowUpDown,
                  onTap: () {
                    Navigator.of(context).pop();
                    log("Recordwise Trades");
                  }, screenWidth: widget.screenWidth,
                ),
              ),
            ],
          ),


          // const SizedBox(height: 30,),
          ExpandableTile(
            title: "TOOLS",
            icon: MdiIcons.tools,
            isExpanded: _expandedIndex == 3,
            onTap: () => _toggleExpansion(3),
            screenWidth: widget.screenWidth,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ChildTile(
                  title: "Configuration",
                  icon: MdiIcons.cog,
                  onTap: () {
                    Navigator.of(context).pop();
                    log("Configuration");
                  }, screenWidth: widget.screenWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ChildTile(
                  title: "Customize Column",
                  icon: MdiIcons.viewColumn,
                  onTap: () {
                    Navigator.of(context).pop();
                    log("Customize Column");
                  }, screenWidth: widget.screenWidth,
                ),
              ),
            ],
          ),

          // SizedBox(height: 30,),
          DrawerListTile(title: "ABOUT",
            icon: Icon(MdiIcons.information,
              size: widget.screenWidth * 0.015,
              color: Colors.black,
            ),
            press: (){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showAbouutDialog(context);
              });
            }, screenWidth: widget.screenWidth,
          ),
        ],
      ),
    );
  }
}
