import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/CrudViewModel.dart';

class CrudWidget<T> extends StatelessWidget {
  final CrudViewModel<T> viewModel;
  final String title;
  final List<DataColumn> Function() createColumns;
  final List<DataRow> Function(CrudViewModel<T>) createRows;
  final void Function(BuildContext context, CrudViewModel<T>, T?) showDialog;

  CrudWidget({
    required this.viewModel,
    required this.title,
    required this.createColumns,
    required this.createRows,
    required this.showDialog,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel..loadItems(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Consumer<CrudViewModel<T>>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (viewModel.errorMessage.isNotEmpty) {
              return Center(child: Text(viewModel.errorMessage));
            } else {
              return Column(
                children: [
                  Expanded(child: _buildDataTable(viewModel)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        showDialog(context, viewModel, null);
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDataTable(CrudViewModel<T> viewModel) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: createColumns(),
        rows: createRows(viewModel),
      ),
    );
  }
}