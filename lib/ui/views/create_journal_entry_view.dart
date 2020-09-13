import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pots_trackr/core/viewmodels/views/create_journal_entry_model.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';
import 'package:stacked/stacked.dart';

class CreateJournalEntryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => CreateJournalEntryViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('New Entry'),
          ),
          body: FormBuilder(
            autovalidate: true,
            child: Column(
              children: [
                FormBuilderTextField(
                  attribute: 'heartRate',
                  decoration: InputDecoration(
                    labelText: 'Heart Rate',
                    labelStyle: TextStyle(color: darkText),
                    icon: Icon(Icons.favorite_border, color: darkText),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
