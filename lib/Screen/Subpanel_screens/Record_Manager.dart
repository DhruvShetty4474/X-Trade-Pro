import 'package:flutter/material.dart';
import 'package:login_test1/Screen/Subpanel_screens/Record_Manager_Datagrid.dart';

class RecordManager extends StatefulWidget {
  const RecordManager({super.key});

  @override
  State<RecordManager> createState() => _RecordManagerState();
}

class _RecordManagerState extends State<RecordManager> {
  bool isMinimized = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

          double dialogWidth;
          double dialogHeight;
          double dialogTop;
          // double dialogWidth = screenWidth * 0.678;
          // double dialogHeight = screenHeight * 0.8;

          if (screenWidth >= 1260 && screenWidth <= 1366 && screenHeight >= 720 && screenHeight <= 768){
            dialogWidth = screenWidth * 0.9;
            dialogHeight = screenHeight * 0.73;
            dialogTop = (screenHeight - dialogHeight) / 2 - 98;
          }else if (screenWidth > 1366 && screenWidth < 1600 && screenHeight > 768 && screenHeight < 900){
            dialogWidth = screenWidth * 0.76;
            dialogHeight = screenHeight * 0.78;
            dialogTop = (screenHeight - dialogHeight) / 2 - 98;
          }else if (screenWidth > 1600 && screenWidth < 1980 && screenHeight > 900 && screenHeight < 1080){
            dialogWidth = screenWidth * 0.678;
            dialogHeight = screenHeight * 0.78;
            dialogTop = (screenHeight - dialogHeight) / 2 - 98;
          }
          else if (screenWidth >= 1024){
            dialogWidth = screenWidth * 0.768;
            dialogHeight = screenHeight * 0.78;
            dialogTop = (screenHeight - dialogHeight) / 2 - 98;
          }
          else{
            dialogWidth = screenWidth * 0.9;
            dialogHeight = screenHeight * 0.8;
            dialogTop = (screenHeight - dialogHeight) / 2 - 98;
          }


          double dialogRight = (screenWidth - dialogWidth) / 2 - 40;

          return Stack(
            children: [
              Positioned(
                // top: dialogTop,
                top:  dialogTop,
                right:  dialogRight,
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      // width: 1200 ,
                      width: dialogWidth,
                      // height: 360,
                      height: dialogHeight,
                      child: RecordManagerDialogScreen(dialogWidth: dialogWidth, dialogHeight: dialogHeight,),
                      // color: Colors.red,
                    ),
                  )
              )
            ],
          );
        },

    );
  }
}


void showRecordManagerDialog(BuildContext context) {
  showDialog(
    context: context,

    barrierDismissible: false,
    builder: (BuildContext context) {
      return RecordManager();
    },
  );
}

class RecordManagerDialogScreen extends StatefulWidget {
  const RecordManagerDialogScreen({super.key, required this.dialogWidth, required this.dialogHeight});
  final double dialogWidth;
  final double dialogHeight;

  @override
  State<RecordManagerDialogScreen> createState() => _RecordManagerDialogScreenState();
}

class _RecordManagerDialogScreenState extends State<RecordManagerDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
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
                'Record Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: widget.dialogWidth * 0.012,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.minimize,
                  size: widget.dialogWidth * 0.015,
                  color: Colors.black,
                ),
                padding: EdgeInsets.only(bottom: 10),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              IconButton(
                icon: Icon(Icons.close,
                  size: widget.dialogWidth* 0.015,
                  color: Colors.black,),
                padding: EdgeInsets.only(bottom: 2),
                onPressed: (){
                  Navigator.of(context).pop();
                }, )
            ],
            centerTitle: false,
          )
      ),
      body: RM(dialogWidth: widget.dialogWidth, dialogHeight: widget.dialogHeight,),


    );
  }
}






