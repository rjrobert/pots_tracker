import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pots_trackr/core/viewmodels/views/home_view_model.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.getJournalEntries(),
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.isBusy,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: darkText,
                ),
                onPressed: () {},
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Drawer'),
                  )
                ],
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              ),
            ),
          ),
        ),
      );
}
