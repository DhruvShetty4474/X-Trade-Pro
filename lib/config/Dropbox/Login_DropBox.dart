

//If the Dropdown not accepted gonna have to make my own using popdownmenu Item....

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Usertypebox extends StatefulWidget {
  final Function(String?) onUserTypeChanged;
  const Usertypebox({super.key, required this.onUserTypeChanged, required this.dialogWidth, required this.dialogHeight});
  final double dialogWidth;
  final double dialogHeight;

  @override
  State<Usertypebox> createState() => _UsertypeboxState();
}

class _UsertypeboxState extends State<Usertypebox> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: widget.dialogWidth*0.4,
        height:  widget.dialogHeight * 0.1,
        child: DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: Text(
            'Select Usertype',
            style: TextStyle(fontSize: widget.dialogWidth*0.02),
          ),
          items: <String>['ADMIN', 'DEALER'].map((String value){
            return DropdownMenuItem<String>(
                value: value,
                child: Text (value,
                  style: TextStyle(fontSize: widget.dialogWidth*0.02),)
            );
          }).toList(),
          validator: (value){
            if(value == null){
              return 'Please select UserType';
            }
            return null;
          },
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            widget.onUserTypeChanged(newValue);
          },
          // onSaved: (value){
          //   _selectedValue = value.toString();
          // },

          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData:  IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize:  widget.dialogWidth*0.043,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100]
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),

        ),
      ),
    );
  }
}

