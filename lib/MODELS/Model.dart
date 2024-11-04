import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
class Record {
  Record(
      this.recType,
      this.recordName,
      this.recID,
      this.status,
      this.spread,
      this.mktSpread,
      this.qty,
      this.maxQty,
      this.tradedQty,
      this.avgTradePrice,
      this.cfTradedQty,
      this.cfAvgTradePrice,
      );

  final String recType;
  final String recordName;
  final int recID;
  final String status;
  final double spread;
  final double mktSpread;
  final int qty;
  final int maxQty;
  final int tradedQty;
  final double avgTradePrice;
  final int cfTradedQty;
  final double cfAvgTradePrice;
}

class RecordDataSource extends DataGridSource {
  RecordDataSource({required List<Record> records}) {
    dataGridRows = records
        .map<DataGridRow>((record) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'Rec Type', value: record.recType),
      DataGridCell<String>(columnName: 'Record Name', value: record.recordName),
      DataGridCell<int>(columnName: 'Rec ID', value: record.recID),
      DataGridCell<String>(columnName: 'Status', value: record.status),
      DataGridCell<double>(columnName: 'Spread', value: record.spread),
      DataGridCell<double>(columnName: 'Mkt Spread', value: record.mktSpread),
      DataGridCell<int>(columnName: 'Qty', value: record.qty),
      DataGridCell<int>(columnName: 'Max Qty', value: record.maxQty),
      DataGridCell<int>(columnName: 'Traded Qty', value: record.tradedQty),
      DataGridCell<double>(columnName: 'Avg Trade Price', value: record.avgTradePrice),
      DataGridCell<int>(columnName: 'CF Traded Qty', value: record.cfTradedQty),
      DataGridCell<double>(columnName: 'CF Avg Trade Price', value: record.cfAvgTradePrice),
    ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];


  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    // Color getBackgroundColor() {
    //   int index = effectiveRows.indexOf(row);
    //   if (index % 2 == 0) {
    //     return Colors.red[100]!;
    //   } else {
    //     return Colors.amber[100]!;
    //   }
    // }
    return DataGridRowAdapter(
      color: Colors.grey[600],
        cells: [
      for (var i = 0; i < row.getCells().length; i++)
        Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.all(8.0),
          child: Text(
            row.getCells()[i].value.toString(),
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
    ]);
  }
  @override
  Widget? buildGroupCaptionCellWidget(
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
        padding: EdgeInsets.symmetric( vertical: 1.5),
        child: Text(summaryValue));
  }
}

// class RecordDataSource extends DataGridSource {
//   RecordDataSource({required List<Record> records}) {
//     _records = records;
//     updateDataGridRows();
//   }
//
//   List<Record> _records = [];
//   List<DataGridRow> dataGridRows = [];
//
//   void updateDataGridRows() {
//     dataGridRows = _records.map<DataGridRow>((record) => DataGridRow(cells: [
//       DataGridCell<String>(columnName: 'Rec Type', value: record.recType),
//       // ... other cells ...
//     ])).toList();
//   }
//
//   @override
//   List<DataGridRow> get rows => dataGridRows;
//
//   DataGridCell getCellValue(DataGridRow row, GridColumn column) {
//     return row.getCells().firstWhere((cell) => cell.columnName == column.columnName);
//   }
//
//
//   bool shouldRecalculateGroupLevels() => true;
//
//   List<String> getGroupedColumns() => ['Rec_Type'];
//
//
//   String getGroupCellValue(DataGridRow row, String columnName) {
//     return row.getCells().firstWhere((cell) => cell.columnName == columnName).value.toString();
//   }
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(cells: [
//       for (var cell in row.getCells())
//         Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             cell.value.toString(),
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//     ]);
//   }
// }