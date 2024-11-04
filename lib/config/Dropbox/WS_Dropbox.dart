import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class WsDropbox_Type_and_StrikePrice extends StatefulWidget {
  const WsDropbox_Type_and_StrikePrice({super.key, required this.items, this.initialValue, this.onChanged, required this.dialogWidth, required this.dialogHeight, required this.size});

  final List<String> items;
  final String? initialValue;
  final Function(String?)? onChanged;
  final double dialogWidth;
  final double dialogHeight;
  final double size;


  @override
  State<WsDropbox_Type_and_StrikePrice> createState() => _WsDropbox_Type_and_StrikePriceState();
}

class _WsDropbox_Type_and_StrikePriceState extends State<WsDropbox_Type_and_StrikePrice> {
  String? _selectedValue;
  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(

        height: widget.dialogHeight,
        width: widget.dialogWidth,
        child: DropdownButtonFormField2(
          isExpanded: true,
          value: _selectedValue,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
            // <String>['Con-Rev'].map((String value)
          items: widget.items.map((String value){
            return DropdownMenuItem<String>(
                value: value,
                child: Text (value,
                  style: TextStyle(fontSize: widget.dialogWidth * widget.size),)
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },

          iconStyleData: IconStyleData(
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: widget.dialogWidth* 0.15,
          ),

          dropdownStyleData: DropdownStyleData(
            maxHeight: widget.dialogHeight * 31,
            width:  widget.dialogWidth * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100]
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
          selectedItemBuilder: (BuildContext context) {
            return widget.items.map<Widget>((String value) {
              return Align(
                alignment: Alignment.centerLeft, // Adjust alignment to ensure visibility
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: widget.dialogWidth * widget.size, // Responsive font size
                    color: Colors.black, // Make sure text color is visible
                  ),
                  overflow: TextOverflow.ellipsis, // Prevent text from overflowing
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}

class WsDropbox_small extends StatefulWidget {
  const WsDropbox_small({super.key,
    required this.items,
    this.initialValue,
    this.onChanged, required this.dialogWidth, required this.dialogHeight, required this.size});

  final List<String> items;
  final String? initialValue;
  final Function(String?)? onChanged;
  final double dialogWidth;
  final double dialogHeight;
  final double size;

  @override
  State<WsDropbox_small> createState() => _WsDropbox_smallState();
}

class _WsDropbox_smallState extends State<WsDropbox_small> {
  String? _selectedValue ;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: widget.dialogWidth,
        height: widget.dialogHeight,
        child: DropdownButtonFormField2(
          isExpanded: true,
          value: _selectedValue,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          items: widget.items.map((String value){
            return DropdownMenuItem<String>(
                value: value,
                child: Center(
                  child: Text (value,
                    style: TextStyle(fontSize: widget.dialogWidth * widget.size),),
                )
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },

          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: widget.dialogWidth* 0.15,
          ),

          dropdownStyleData: DropdownStyleData(
            maxHeight: widget.dialogHeight * 31,
            width:  widget.dialogWidth * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100]
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 6),
          ),
          selectedItemBuilder: (BuildContext context) {
            return widget.items.map<Widget>((String value) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: widget.dialogWidth * widget.size, // Responsive font size
                    color: Colors.black, // Make sure text color is visible
                  ),
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}

class Expiry extends StatefulWidget {
  const Expiry({super.key, required this.dialogWidth, required this.dialogHeight, required this.size});
  final double dialogWidth;
  final double dialogHeight;
  final double size;

  @override
  State<Expiry> createState() => _ExpiryState();
}

class _ExpiryState extends State<Expiry> {
  String? _selectedValue ;
  @override
  Widget build(BuildContext context) {
    final List<String> dateList = List.generate(3, (index) {
      final now = DateTime.now();
      final date = now.add(Duration(days: index));
      return DateFormat('dd-MM-yyyy').format(date);
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // width: 140,
        // height: 40,
        width: widget.dialogWidth,
        height: widget.dialogHeight,
        child: DropdownButtonFormField2(
          isExpanded: true,
          value: _selectedValue,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          items: dateList.map((String value){
            return DropdownMenuItem<String>(
                value: value,
                child: Center(
                  child: Text (value,
                    style: TextStyle(fontSize: widget.dialogWidth * widget.size),),
                )
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },

          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: widget.dialogWidth* 0.15,
          ),

          dropdownStyleData: DropdownStyleData(
            maxHeight: widget.dialogHeight * 31,
            width:  widget.dialogWidth * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100]
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 6),
          ),
          selectedItemBuilder: (BuildContext context) {
            return dateList.map<Widget>((String value) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: widget.dialogWidth * widget.size, // Responsive font size
                    color: Colors.black, // Visible text color
                  ),
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}



