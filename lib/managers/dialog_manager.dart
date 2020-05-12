import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pots_trackr/core/models/dialog_models.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();

    // _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) => widget.child;

  void _showDialog(DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;

    // Alert(
    //     context: context,
    //     title: request.title,
    //     desc: request.description,
    //     closeFunction: () =>
    //         _dialogService.dialogComplete(DialogResponse(confirmed: false)),
    //     buttons: [
    //       if (isConfirmationDialog)
    //         DialogButton(
    //           child: Text(request.cancelTitle),
    //           onPressed: () {
    //             _dialogService.dialogComplete(DialogResponse(confirmed: false));
    //           },
    //         ),
    //       DialogButton(
    //         child: Text(request.buttonTitle),
    //         onPressed: () {
    //           _dialogService.dialogComplete(DialogResponse(confirmed: true));
    //         },
    //       )
    //     ]).show();
  }
}
