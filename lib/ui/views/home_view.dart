import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pots_trackr/app/app_constants.dart';
import 'package:pots_trackr/core/viewmodels/views/home_view_model.dart';
import 'package:pots_trackr/ui/widgets/journal_list.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.isBusy,
          child: Scaffold(
            appBar: AppBar(
              // backgroundColor: Theme.of(context).backgroundColor,
              // elevation: 0,
              title: Text(AppConstants.AppName),
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Drawer'),
                  ),
                  RaisedButton(
                    child: Text('Logout'),
                    onPressed: () {
                      model.signOut();
                    },
                  )
                ],
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            body: JournalList(),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => model.navigateToCreateJournalView(),
            ),
          ),
        ),
      );
}
