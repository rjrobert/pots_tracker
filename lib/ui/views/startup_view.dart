import 'package:flutter/material.dart';
import 'package:pots_trackr/core/viewmodels/views/startup_view_model.dart';
import 'package:pots_trackr/ui/widgets/login_background.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<StartUpViewModel>.reactive(
        viewModelBuilder: () => StartUpViewModel(),
        onModelReady: (model) => model.handleStartupLogic(),
        createNewModelOnInsert: true,
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              LoginBackgroud(),
              // Image.asset('assets/images/logo.svg'),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      height: 100,
                    ),
                    CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(Color(0xff19c7c1)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
