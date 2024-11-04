import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../config/Buttons/Buttons.dart';
import '../Screens.dart';

class RM extends StatefulWidget {
  final double dialogWidth;
  final double dialogHeight;
  const RM({super.key, required this.dialogWidth, required this.dialogHeight});

  @override
  State<RM> createState() => _RMState();
}

class _RMState extends State<RM> {
  late final RecordDataSource recordDataSource;
  // final DataGridController _dataGridController = DataGridController();
  bool selectAll = false;
  static const double _buttonWidthFactor = 0.07;
  static const double _buttonHeightFactor = 0.01;
  static const double _spacingFactor = 0.015;

  //Temporary data for the dataGrid.
  final List<Record> records = <Record>[
    Record('Con-Rev', 'U=n 221\t', 1, 'Stopped', 1.0, -243.760, 1, 1, 0, 0.0, 0, 0.0),
    Record('Con-Rev', 'U=n 222\t', 2, 'Running', 1.0, 1248.680, 1, 1, 0, 0.0, 0, 0.0),
    Record('Con-Rev', 'U=n 223\t', 3, 'Stopped', 1.0, 3248.680, 1, 1, 0, 0.0, 0, 0.0),
    // Add more records here...
  ];

  @override
  void initState(){
    super.initState();
    recordDataSource = RecordDataSource(records: records,);
    //have to change the name of the group column and have to include if necessary for grouping.
    recordDataSource.addColumnGroup(ColumnGroup(name: 'Rec_Type', sortGroupRows: false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //BTNs for the Record manager.
        Container(
        width: widget.dialogWidth,
        height: 50,
        color: Colors.white,
        child: Row(
          children: [
            _buildSpacing(),
            _buildButton('Start', Colors.green),
            _buildSpacing(),
            _buildButton('Stop', Colors.red),
            _buildSpacing(),
            _buildButton('Stop All', Colors.orange),
            _buildSpacing(),
            _buildButton('Delete', Colors.blue),
          ],
        ),
      ),

        Expanded(
            child: Container(
              color: Colors.grey[200],//color
              width: widget.dialogWidth,
              child: SfDataGridTheme(
                data: SfDataGridThemeData(
                  headerColor: Colors.orange,//change the color of the header cell.
                  // rowHoverColor: Colors.red,
                  selectionColor: Colors.blue.withOpacity(0.3),
                  gridLineColor: Colors.white,//change the color of the grid line.
                ),
                child: SfDataGrid(
                  //how to define group area in syncfusion...(showgroupdroparea in cpp)....
                    rowHeight: 25,//set the height of the row in the data grid.
                    headerRowHeight: 27,//set the height of the header row in the data grid.
                    columnWidthMode: ColumnWidthMode.auto,
                    columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
                    gridLinesVisibility: GridLinesVisibility.both,//enables the gridlines of row.
                    headerGridLinesVisibility: GridLinesVisibility.both,//enables the gridlines of header.
                    showCheckboxColumn: true,//enables checkbox column option.
                    // controller: _dataGridController,
                    selectionMode: SelectionMode.multiple,//let us select the multiple checkboxes.

                    navigationMode: GridNavigationMode.cell,//navigate the selected cell/row.
                    // allowSorting: true,
                    allowExpandCollapseGroup: true,//enables the expand and collapse of the group row.
                    source: recordDataSource,//this is where data is stored.
                    isScrollbarAlwaysShown: true,//enables a scrollbar for the datagrid.
                    columns: <GridColumn>[
                      //sets the header of the data grid.
                      GridColumn(
                          columnName: 'Rec_Type',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Rec Type', style: TextStyle(fontSize: 12,color: Colors.white)))
                      ),
                      GridColumn(
                          columnName: 'Record_Name',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Record Name', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Rec_ID',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Rec ID', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Status',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Status', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Spread',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Spread', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Mkt Spread',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Mkt Spread', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Qty',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Qty', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Max Qty',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Max Qty', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Traded Qty',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Traded Qty', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'Avg Trade Price',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('Avg Trade Price', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'CF Traded Qty',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('CF Traded Qty', style: TextStyle(fontSize: 12,color: Colors.white)))),
                      GridColumn(
                          columnName: 'CF Avg Trade Price',
                          label: Container(
                              // padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Text('CF Avg Trade Price', style: TextStyle(fontSize: 12,color: Colors.white)))),
                    ]
                ),
              ),
            )
        ),
      ]
    );
  }
  Widget _buildButton(String text, Color color) {
    return RecordManager_btn(
      text: text,
      dialogWidth: widget.dialogWidth * _buttonWidthFactor,
      dialogHeight: widget.dialogHeight * _buttonHeightFactor,
      color: color,
    );
  }
  Widget _buildSpacing() {
    return SizedBox(
      width: widget.dialogWidth * _spacingFactor,
      height: widget.dialogHeight * 0.07,
    );
  }
}

