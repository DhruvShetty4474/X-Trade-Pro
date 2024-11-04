import 'package:flutter/material.dart';

import '../../config/Buttons/Sub_screeen_btn.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          double dialogWidth = screenWidth * 0.35;
          double dialogHeight = screenHeight * 0.32;

          return Stack(
            children: [
              Positioned(
                  child: Center(
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        // width: 620 ,
                        width: dialogWidth ,
                        // height: 360,
                        height: dialogHeight,
                        child: AboutDialogScreen(dialogWidth: dialogWidth, dialogHeight: dialogHeight,),
                        // color: Colors.red,
                      ),
                    ),
                  )
              )
            ],
          );
        }
    );
  }
}

void showAbouutDialog(BuildContext context) {
  showDialog(
    context: context,

    barrierDismissible: false,
    builder: (BuildContext context) {
      return About();
    },
  );
}


class AboutDialogScreen extends StatefulWidget {
  const AboutDialogScreen({super.key, required this.dialogWidth, required this.dialogHeight});
  final double dialogWidth;
  final double dialogHeight;

  @override
  State<AboutDialogScreen> createState() => _AboutDialogScreenState();
}

class _AboutDialogScreenState extends State<AboutDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.0),
        child: AppBar(
          backgroundColor: Colors.grey,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/logo1.png",
              fit: BoxFit.contain,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              'About X-TradePro',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.dialogWidth * 0.03,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: IconButton(
                icon: Icon(Icons.close,
                  size: widget.dialogWidth * 0.03,
                  color: Colors.black,),
                onPressed: (){
                  Navigator.of(context).pop();
                }, ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            //1
            SizedBox(height: widget.dialogHeight * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: widget.dialogWidth * 0.06,),
                Text('Version',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: widget.dialogWidth * 0.5,),
                Text('1.0.0.0',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            //2
            SizedBox(height: widget.dialogHeight * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: widget.dialogWidth * 0.06,),
                Text('Exchange Supported',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: widget.dialogWidth * 0.31,),
                Text('NSE',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //3
            SizedBox(height: widget.dialogHeight * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: widget.dialogWidth * 0.06,),
                Text('Segment Supported',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: widget.dialogWidth * 0.32,),
                Text('Future and Option',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //4
            SizedBox(height: widget.dialogHeight * 0.05,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This software is protected by copyright laws.',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Unauthorized distribution or replication is strictly prohibited.',
                  style: TextStyle(
                    fontSize: widget.dialogWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.dialogHeight * 0.1),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SubScreeenBtnBTN(text:'Close', dialogWidth: widget.dialogWidth * 0.15, dialogHeight: widget.dialogHeight * 0.15, size: 0.15,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
