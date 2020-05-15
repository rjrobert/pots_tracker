import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';
import 'package:pots_trackr/ui/shared/ui_helpers.dart';

import 'package:pots_trackr/core/viewmodels/views/login_view_model.dart';
import 'package:pots_trackr/ui/widgets/login_background.dart';
import 'package:pots_trackr/ui/widgets/login_card.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: background,
          body: ModalProgressHUD(
            inAsyncCall: model.isBusy,
            child: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  LoginBackgroud(),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          verticalSpaceMassive,
                          LoginCard(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
