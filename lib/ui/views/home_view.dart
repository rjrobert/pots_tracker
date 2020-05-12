import 'package:flutter/material.dart';
import 'package:pots_trackr/core/viewmodels/views/home_view_model.dart';
import 'package:pots_trackr/ui/widgets/busy_button.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BusyButton(
                  title: 'Sign Out',
                  busy: model.isBusy,
                  onPressed: () => model.signOut(),
                ),
              ],
            ),
          ),
        ),
      );
}
