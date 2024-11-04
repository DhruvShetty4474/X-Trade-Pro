import 'dart:developer';

import 'package:flutter/material.dart';

import '../../config/Buttons/Buttons.dart';
import '../../config/Dropbox/Dropbox.dart';
import '../../config/TEXTFEILD/Addrecords_textfeild.dart';


class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        double dialogWidth;
        double dialogHeight;

        if (screenWidth >= 1260 && screenWidth <= 1600 && screenHeight >= 720 && screenHeight <= 900) {
          // Larger screens within a specific range (e.g., standard large desktops)
          dialogWidth = screenWidth * 0.614;
          dialogHeight = screenHeight * 0.4;
        } else if (screenWidth > 1600 && screenWidth <= 2560 && screenHeight > 900 && screenHeight <= 1440) {
          // Medium to large screens (e.g., high-resolution monitors)
          dialogWidth = screenWidth * 0.6;
          dialogHeight = screenHeight * 0.35;
        } else if (screenWidth >= 1024) {
          // General medium screens (e.g., tablets, smaller desktops)
          dialogWidth = screenWidth * 0.6;
          dialogHeight = screenHeight * 0.45;
        } else {
          // Smaller screens or those that don't fit the above conditions (e.g., mobile devices)
          dialogWidth = screenWidth * 0.614;
          dialogHeight = screenHeight * 0.45;
        }

        // Calculate the position to center the dialog
        double dialogTop = (screenHeight - dialogHeight) / 2 - 80;
        double dialogRight = (screenWidth - dialogWidth) / 2.3;

        return Stack(
          children: [
            Positioned(
                top: dialogTop,
                right: dialogRight,
                child: Center(
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      // width: 1200 ,
                      width: dialogWidth,
                      // height: 360,
                      height: dialogHeight,
                      child: NewRecordDialogScreen(dialogWidth: dialogWidth, dialogHeight: dialogHeight,),
                      // color: Colors.red,
                    ),
                  ),
                )
            )
          ],
        );
      },

    );
  }
}


void showAddedNewRecordsDialog(BuildContext context) {
  showDialog(
    context: context,

    barrierDismissible: false,
    builder: (BuildContext context) {
      return AddRecord();
    },
  );
}


//working on this........
class NewRecordDialogScreen extends StatefulWidget {
  const NewRecordDialogScreen({super.key, required this.dialogWidth, required this.dialogHeight});
  final double dialogWidth;
  final double dialogHeight;

  @override
  State<NewRecordDialogScreen> createState() => _NewRecordDialogScreenState();
}

class _NewRecordDialogScreenState extends State<NewRecordDialogScreen> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                'Add New Record',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.close,
                  size: widget.dialogWidth* 0.02,
                  color: Colors.black,),
                onPressed: (){
                  Navigator.of(context).pop();
                }, )
            ],
            centerTitle: true,
          )
      ),


      //body section...............

      body: Column(
        children: [
          // Row 1
          Row(
            children: [
              SizedBox(width: widget.dialogWidth * 0.01),
              Text(
                'Type',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),

              SizedBox(width: widget.dialogWidth * 0.001,),
              WsDropbox_Type_and_StrikePrice(items: ['Con-Rev'], dialogWidth: widget.dialogWidth * 0.1, dialogHeight: widget.dialogHeight * 0.118,size: 0.137),
              SizedBox(width: widget.dialogWidth * 0.01),
              Text('Name',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),),
              SizedBox(width: widget.dialogWidth * 0.01),
              //working from here responive....

              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.20, dialogHeight: widget.dialogHeight * 0.118, size: 0.07,),

              SizedBox(width: widget.dialogWidth * 0.01),
              Text('Difference',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.01),

              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.15, dialogHeight: widget.dialogHeight * 0.118, size: 0.1,),

              SizedBox(width: widget.dialogWidth * 0.01),
              Text('Adjustment Factor',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.007),

              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.15, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),
            ],
          ),
          //Row 2
          Row(
            children: [
              SizedBox(width: widget.dialogWidth * 0.025),
              Text(
                'B/S',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.03),
              Text(
                'Select Contract',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.051),
              Text(
                'Expiry',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),

              SizedBox(width: widget.dialogWidth * 0.057),
              Text(
                'OpTy',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),

              SizedBox(width: widget.dialogWidth * 0.047),
              Text(
                'Strike Pr.',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.0344,),
              Text(
                'Ratio',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              Spacer(),
              Text(
                'Reverse',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.07,),
            ],
          ),
          //Row 3
          Row(
            children: [
              // B/S
              WsDropbox_small(items: ['B','S'], dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118, size: 0.24,),
              //Expiry....
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.13, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),

              Expiry(dialogWidth: widget.dialogWidth * 0.11, dialogHeight: widget.dialogHeight * 0.118, size: 0.108,),
              // Op Ty.......
              WsDropbox_small(items: ['XX', 'PE', 'CE'],dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118, size: 0.24,),
              // Strike Pr......
              WsDropbox_Type_and_StrikePrice(items: ['2600'], dialogWidth: widget.dialogWidth * 0.1, dialogHeight: widget.dialogHeight * 0.118,size: 0.16),
              SizedBox(width: widget.dialogWidth * 0.01,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118,size: 0.34),
              SizedBox(width: widget.dialogWidth * 0.01,),
              Text(
                'Spread',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.03,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.14, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),
              SizedBox(width: widget.dialogWidth * 0.01,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.14, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),
            ],
          ),
          //Row 4
          Row(
            children: [
              // B/S
              WsDropbox_small(items: ['B','S'], dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118, size: 0.24,),
              //Expiry....
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.13, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),

              Expiry(dialogWidth: widget.dialogWidth * 0.11, dialogHeight: widget.dialogHeight * 0.118, size: 0.108,),
              // Op Ty.......
              WsDropbox_small(items: ['XX', 'PE', 'CE'],dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118, size: 0.24,),
              // Strike Pr......
              WsDropbox_Type_and_StrikePrice(items: ['2600'], dialogWidth: widget.dialogWidth * 0.1, dialogHeight: widget.dialogHeight * 0.118,size: 0.16),
              SizedBox(width: widget.dialogWidth * 0.01,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118,size: 0.34),
              SizedBox(width: widget.dialogWidth * 0.01,),
              Text(
                'Qty(Lots)',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.015,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.14, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),
              SizedBox(width: widget.dialogWidth * 0.01,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.14, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),
            ],
          ),
          // //Row 5
          Row(
            children: [
              // B/S
              WsDropbox_small(items: ['B','S'], dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118, size: 0.24,),
              //Expiry....
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.13, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),

              Expiry(dialogWidth: widget.dialogWidth * 0.11, dialogHeight: widget.dialogHeight * 0.118, size: 0.108,),
              // Op Ty.......
              WsDropbox_small(items: ['XX', 'PE', 'CE'],dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118, size: 0.24,),
              // Strike Pr......
              WsDropbox_Type_and_StrikePrice(items: ['2600'], dialogWidth: widget.dialogWidth * 0.1, dialogHeight: widget.dialogHeight * 0.118,size: 0.16),
              SizedBox(width: widget.dialogWidth * 0.01,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.06, dialogHeight: widget.dialogHeight * 0.118,size: 0.34),
              SizedBox(width: widget.dialogWidth * 0.01,),
              Text(
                'Max(Lots)',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.01,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.14, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),
              SizedBox(width: widget.dialogWidth * 0.01,),
              AddrecordsTextfeild(text: '', dialogWidth: widget.dialogWidth * 0.14, dialogHeight: widget.dialogHeight * 0.118,size: 0.1),

            ],
          ),
          SizedBox(height: widget.dialogHeight *0.0,),
          // //Row 6
          Row(
            children: [
              Spacer(),
              Transform.scale(
                scale:widget.dialogHeight * 0.003,
                child: Checkbox(
                  value: _isChecked,
                  activeColor: Colors.blue,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false; // Update state with the new value
                    });
                  },
                ),
              ),
              Text(
                'Write to File',
                style: TextStyle(
                  fontSize: widget.dialogWidth * 0.017,
                ),
              ),
              SizedBox(width: widget.dialogWidth * 0.05),
              SubScreeenBtnBTN(text: 'Record Added',  dialogWidth: widget.dialogWidth * 0.15, dialogHeight: widget.dialogHeight * 0.14, size: 0.1,),
              SizedBox(width: widget.dialogWidth * 0.05),
              SubScreeenBtnBTN(text: 'Cancel', dialogWidth: widget.dialogWidth * 0.14, dialogHeight: widget.dialogHeight * 0.14, size: 0.1,),
              SizedBox(width: widget.dialogWidth * 0.05),
            ],
          )
        ],
      ),
    );
  }
}
