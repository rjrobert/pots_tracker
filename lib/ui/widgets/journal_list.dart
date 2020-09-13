import 'package:flutter/material.dart';
import 'package:pots_trackr/core/viewmodels/views/home_view_model.dart';
import 'package:stacked/stacked.dart';

class JournalList extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) =>
      viewModel.data == null
          ? Container(
              child: Center(
                child: Text("No Journal Entries!"),
              ),
            )
          : ListView.builder(
              itemCount: viewModel.data.length,
              itemBuilder: (context, index) => Container(
                height: 60,
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(viewModel.data[index].createdAt.toString()),
                      ),
                    ),
                  ],
                ),
              ),
            );
}
