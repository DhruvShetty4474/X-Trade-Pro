import 'package:flutter/material.dart';

class ExpandableTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<Widget> children;
  final double screenWidth;

  const ExpandableTile({
    super.key,
    required this.title,
    required this.icon,
    required this.isExpanded,
    required this.onTap,
    required this.children,
    required this.screenWidth
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerListTile(
          title: title,
          icon: Icon(icon, size: screenWidth * 0.015, color: Colors.black),
          press: onTap,
          tail: Icon(
            isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: Colors.black,
          ),
          screenWidth: screenWidth,
        ),
        if (isExpanded) ...children,
      ],
    );
  }
}

class ChildTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final double screenWidth;

  const ChildTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.screenWidth
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: DrawerListTile(
        title: title,
        icon: Icon(icon, size: screenWidth * 0.01, color: Colors.black),
        press: onTap,
        bg_color: Colors.grey[400],
        screenWidth: screenWidth,
      ),
    );
  }
}

class DrawerListTile extends StatefulWidget {
  final String title;
  final Icon icon;
  final VoidCallback press;
  final Color? bg_color;
  final Icon? tail;
  final double screenWidth;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
    this.bg_color,
    this.tail,
    required this.screenWidth,
  });

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widget.screenWidth;
    return MouseRegion(
      onEnter: (_) => setState(() => _backgroundColor = Colors.grey[500]),
      onExit: (_) => setState(() => _backgroundColor = widget.bg_color),
      child: Container(
        color: _backgroundColor ?? widget.bg_color,
        child: ListTile(
          horizontalTitleGap: screenWidth * 0.008,
          leading: widget.icon,
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:   screenWidth * 0.01,
            ),
          ),
          trailing: widget.tail,
          onTap: widget.press,
        ),
      ),
    );
  }
}
Widget buildDrawerHeader(double screenWidth) {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo1.png",
          height: screenWidth * 0.025,
          cacheHeight: 100,  // Caching for performance
        ),
        SizedBox(height: screenWidth * 0.01),
        Text(
          'X-TRADE PRO',
          style: TextStyle(
            fontSize: screenWidth * 0.013,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}